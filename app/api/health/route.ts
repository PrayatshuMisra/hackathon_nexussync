import { NextResponse } from 'next/server'
import { supabase } from '@/lib/supabase'

export async function GET() {
  try {
    const healthCheck = {
      timestamp: new Date().toISOString(),
      status: 'checking',
      environment: {
        hasSupabaseUrl: !!process.env.NEXT_PUBLIC_SUPABASE_URL,
        hasSupabaseKey: !!process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY,
        baseUrl: process.env.NEXT_PUBLIC_BASE_URL || 'not set',
        nodeEnv: process.env.NODE_ENV
      },
      database: {
        status: 'unknown',
        error: null as string | null
      },
      tables: {
        users: 'unknown',
        confirmation_tokens: 'unknown',
        user_sessions: 'unknown'
      }
    }

    try {
      const { data, error } = await supabase.from('users').select('count').limit(1)
      
      if (error) {
        healthCheck.database.status = 'error'
        healthCheck.database.error = error.message
        
        if (error.code === 'PGRST116' || error.message?.includes('relation "users" does not exist')) {
          healthCheck.tables.users = 'missing'
        }
      } else {
        healthCheck.database.status = 'connected'
        healthCheck.tables.users = 'exists'
      }
    } catch (dbError) {
      healthCheck.database.status = 'error'
      healthCheck.database.error = dbError instanceof Error ? dbError.message : 'Unknown error'
    }

    try {
      const { error: tokenError } = await supabase.from('confirmation_tokens').select('id').limit(1)
      healthCheck.tables.confirmation_tokens = tokenError ? 'missing' : 'exists'
    } catch {
      healthCheck.tables.confirmation_tokens = 'missing'
    }

    try {
      const { error: sessionError } = await supabase.from('user_sessions').select('id').limit(1)
      healthCheck.tables.user_sessions = sessionError ? 'missing' : 'exists'
    } catch {
      healthCheck.tables.user_sessions = 'missing'
    }

    if (healthCheck.database.status === 'connected' && 
        healthCheck.tables.users === 'exists' && 
        healthCheck.tables.confirmation_tokens === 'exists') {
      healthCheck.status = 'healthy'
    } else if (healthCheck.database.status === 'error') {
      healthCheck.status = 'unhealthy'
    } else {
      healthCheck.status = 'degraded'
    }

    return NextResponse.json(healthCheck, {
      status: healthCheck.status === 'healthy' ? 200 : 503
    })

  } catch (error) {
    return NextResponse.json({
      timestamp: new Date().toISOString(),
      status: 'error',
      error: error instanceof Error ? error.message : 'Unknown error'
    }, { status: 500 })
  }
} 