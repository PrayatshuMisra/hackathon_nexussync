import { type ClassValue, clsx } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}

export function generateUUID(): string {

  if (typeof crypto !== 'undefined' && crypto.randomUUID) {
    return crypto.randomUUID()
  }

  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
    const r = Math.random() * 16 | 0;
    const v = c === 'x' ? r : (r & 0x3 | 0x8);
    return v.toString(16);
  });
}

export function getBaseUrl(): string {
  let baseUrl = process.env.NEXT_PUBLIC_BASE_URL
  
  if (!baseUrl) {
    if (process.env.NODE_ENV === 'production') {
 
      baseUrl = process.env.VERCEL_URL 
        ? `https://${process.env.VERCEL_URL}`
        : 'https://hackathon-nexussync.vercel.app'
    } else {
 
      baseUrl = 'http://localhost:3000'
    }
  }

  if (baseUrl && !baseUrl.startsWith('http')) {
    baseUrl = `https://${baseUrl}`
  }
  
  return baseUrl
}
