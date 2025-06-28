import { supabase } from './supabase'
import { EmailService } from './email-service'
import { randomUUID } from 'crypto'

export interface EmailConfirmationData {
  registrationNumber: string
  email: string
  confirmationUrl: string
  studentName: string
}

export interface ConfirmationResponse {
  success: boolean
  message?: string
  email?: string
  error?: string
}

export interface VerificationResponse {
  success: boolean
  user?: any
  sessionToken?: string
  error?: string
}

export async function sendConfirmationEmail(identifier: string): Promise<ConfirmationResponse> {
  try {

    const isEmail = identifier.includes('@')
    
    let query = supabase
      .from('users')
      .select('*')
      .eq('role', 'student')
    
    if (isEmail) {
      query = query.eq('email', identifier)
    } else {
      query = query.eq('registration_number', identifier)
    }
    
    const { data: student, error: studentError } = await query.single()

    if (studentError || !student) {
      return {
        success: false,
        error: isEmail ? 'Student not found with this email address' : 'Student not found with this registration number'
      }
    }

    const confirmationToken = randomUUID()
    const expiresAt = new Date(Date.now() + 24 * 60 * 60 * 1000)

    const { error: tokenError } = await supabase
      .from('confirmation_tokens')
      .insert({
        token: confirmationToken,
        user_id: student.id,
        email: student.email,
        expires_at: expiresAt.toISOString(),
        used: false
      })

    if (tokenError) {
      console.error('Error storing confirmation token:', tokenError)
      return {
        success: false,
        error: 'Failed to generate confirmation link'
      }
    }

    const baseUrl = process.env.NEXT_PUBLIC_BASE_URL || 'https://your-app.vercel.app'
    const confirmationUrl = `${baseUrl}/confirm-email?token=${confirmationToken}`

    const emailData = {
      registrationNumber: student.registration_number,
      email: student.email,
      confirmationUrl,
      studentName: student.full_name || 'Student'
    }

    const emailResult = await EmailService.sendConfirmationEmail(emailData)

    if (!emailResult.success) {
      console.error('Email sending failed:', emailResult.error)

    }

    return {
      success: true,
      message: `Confirmation email sent to ${student.email}`,
      email: student.email
    }

  } catch (error) {
    console.error('Error in sendConfirmationEmail:', error)
    return {
      success: false,
      error: 'Internal server error'
    }
  }
}

export async function verifyConfirmationToken(token: string): Promise<VerificationResponse> {
  try {
  
    const { data: confirmationData, error: tokenError } = await supabase
      .from('confirmation_tokens')
      .select('*')
      .eq('token', token)
      .eq('used', false)
      .single()

    if (tokenError || !confirmationData) {
      return {
        success: false,
        error: 'Invalid or expired confirmation token'
      }
    }

    if (new Date(confirmationData.expires_at) < new Date()) {
      return {
        success: false,
        error: 'Confirmation token has expired'
      }
    }

    const { data: user, error: userError } = await supabase
      .from('users')
      .select('*')
      .eq('id', confirmationData.user_id)
      .single()

    if (userError || !user) {
      return {
        success: false,
        error: 'User not found'
      }
    }

    await supabase
      .from('confirmation_tokens')
      .update({ used: true })
      .eq('token', token)

    const sessionToken = randomUUID()
    const sessionExpiresAt = new Date(Date.now() + 7 * 24 * 60 * 60 * 1000) // 7 days

    await supabase
      .from('user_sessions')
      .insert({
        token: sessionToken,
        user_id: user.id,
        expires_at: sessionExpiresAt.toISOString()
      })

    return {
      success: true,
      user: {
        id: user.id,
        registrationNumber: user.registration_number,
        email: user.email,
        fullName: user.full_name,
        role: user.role,
        department: user.department,
        yearOfStudy: user.year_of_study,
        profileImageUrl: user.profile_image_url
      },
      sessionToken
    }

  } catch (error) {
    console.error('Error in verifyConfirmationToken:', error)
    return {
      success: false,
      error: 'Internal server error'
    }
  }
}

export async function checkStudentExists(registrationNumber: string): Promise<boolean> {
  try {
    const { data, error } = await supabase
      .from('users')
      .select('id')
      .eq('registration_number', registrationNumber)
      .eq('role', 'student')
      .single()

    return !error && !!data
  } catch (error) {
    return false
  }
} 