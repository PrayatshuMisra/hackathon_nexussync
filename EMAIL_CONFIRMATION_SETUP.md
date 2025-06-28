# Email Confirmation Setup Guide

This guide explains how to set up the email confirmation functionality for student login in NexusSync.

## Overview

The email confirmation system allows students to:
1. Enter their registration number on the login form
2. Receive a confirmation email with a secure link
3. Click the link to confirm their email and access their dashboard

## Implementation Approach

This implementation uses **direct function calls** (similar to the signup form) instead of API routes for better consistency with the existing codebase.

## Database Setup

### 1. Run the SQL Script

Execute the SQL script to create the necessary tables:

```sql
-- Run the script: scripts/03-email-confirmation-tables.sql
```

This creates:
- `confirmation_tokens` table - stores confirmation tokens
- `user_sessions` table - stores user session tokens
- Indexes for better performance
- Cleanup function for expired tokens

### 2. Verify Table Creation

Check that the tables were created successfully:

```sql
-- Check tables exist
SELECT table_name FROM information_schema.tables 
WHERE table_schema = 'public' 
AND table_name IN ('confirmation_tokens', 'user_sessions');

-- Check indexes
SELECT indexname, tablename FROM pg_indexes 
WHERE tablename IN ('confirmation_tokens', 'user_sessions');
```

## Environment Variables

Add these environment variables to your `.env.local` file:

```env
# Base URL for your application (used in confirmation links)
NEXT_PUBLIC_BASE_URL=http://localhost:3000

# Supabase configuration (should already be set)
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
```

## Email Service Configuration

### Option 1: Supabase Auth (Current Implementation)

The current implementation uses Supabase Auth's built-in email functionality. This works for demo purposes but has limitations.

### Option 2: Dedicated Email Service (Recommended for Production)

For production, integrate with a dedicated email service:

#### Using SendGrid:
1. Install SendGrid: `npm install @sendgrid/mail`
2. Update `lib/email-service.ts` to use SendGrid
3. Add SendGrid API key to environment variables

#### Using Resend:
1. Install Resend: `npm install resend`
2. Update `lib/email-service.ts` to use Resend
3. Add Resend API key to environment variables

#### Using AWS SES:
1. Install AWS SDK: `npm install @aws-sdk/client-ses`
2. Update `lib/email-service.ts` to use AWS SES
3. Configure AWS credentials

## Testing the Email Confirmation

### 1. Test with Demo Data

Use the demo registration number: `220701001`

### 2. Check Email Delivery

For demo purposes, emails are logged to the console. Check the browser console for email content.

### 3. Test Confirmation Flow

1. Enter registration number on login form
2. Click "Send Confirmation Email"
3. Check console for email content
4. Copy the confirmation URL from console
5. Open the URL in a new tab
6. Verify redirect to student dashboard

## Production Considerations

### 1. Email Service

Replace the demo email service with a production email service:
- SendGrid
- Resend
- AWS SES
- Mailgun
- etc.

### 2. Security

- Implement rate limiting for email sending
- Add CAPTCHA for registration number entry
- Use HTTPS for all confirmation links
- Implement proper session management

### 3. Monitoring

- Add email delivery tracking
- Monitor failed email attempts
- Set up alerts for system issues

### 4. Database Maintenance

Set up a cron job to clean up expired tokens:

```sql
-- Run cleanup function daily
SELECT cron.schedule('cleanup-expired-tokens', '0 2 * * *', 'SELECT cleanup_expired_tokens();');
```

## Troubleshooting

### Common Issues

1. **Email not sending**: Check email service configuration
2. **Token not found**: Verify database tables are created
3. **Confirmation link expired**: Check token expiration time
4. **Redirect not working**: Verify NEXT_PUBLIC_BASE_URL is set correctly

### Debug Steps

1. Check browser console for errors
2. Verify database for token storage
3. Test email service independently
4. Check Supabase logs for database errors

## Function API

### sendConfirmationEmail(registrationNumber: string)
Sends confirmation email to student

**Parameters:**
- `registrationNumber`: Student's registration number

**Returns:**
```typescript
{
  success: boolean
  message?: string
  email?: string
  error?: string
}
```

### verifyConfirmationToken(token: string)
Verifies confirmation token and authenticates user

**Parameters:**
- `token`: Confirmation token from email link

**Returns:**
```typescript
{
  success: boolean
  user?: {
    id: string
    registrationNumber: string
    email: string
    fullName: string
    role: string
    department?: string
    yearOfStudy?: number
    profileImageUrl?: string
  }
  sessionToken?: string
  error?: string
}
```

### checkStudentExists(registrationNumber: string)
Checks if a student exists by registration number

**Parameters:**
- `registrationNumber`: Student's registration number

**Returns:**
```typescript
boolean
```

## File Structure

```
├── app/
│   ├── confirm-email/
│   │   └── page.tsx
│   └── dashboard/
│       └── student/
│           └── page.tsx
├── components/
│   └── auth/
│       └── enhanced-login-form.tsx
├── lib/
│   ├── email-confirmation.ts
│   ├── email-service.ts
│   └── supabase.ts
└── scripts/
    └── 03-email-confirmation-tables.sql
```

## Key Differences from API Route Approach

1. **Direct Function Calls**: Uses `lib/email-confirmation.ts` functions directly
2. **No API Routes**: Eliminates the need for `/api/send-confirmation` and `/api/verify-confirmation`
3. **Consistent Pattern**: Matches the signup form implementation approach
4. **Better Performance**: No HTTP overhead for internal function calls
5. **Easier Debugging**: Direct function calls are easier to debug and test 