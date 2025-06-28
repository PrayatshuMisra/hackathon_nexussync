import type { User } from "@/types"

const mockUsers = [
  {
    id: 1,
    registrationNumber: "220701001",
    email: "john.doe@learner.manipal.edu",
    passwordHash: "student123",
    fullName: "John Doe",
    role: "student" as const,
    department: "Computer Science Engineering",
    yearOfStudy: 3,
  },
  {
    id: 2,
    registrationNumber: "220701002",
    email: "jane.smith@learner.manipal.edu",
    passwordHash: "student123",
    fullName: "Jane Smith",
    role: "student" as const,
    department: "Information Technology",
    yearOfStudy: 3,
  },
  {
    id: 3,
    registrationNumber: "240962386",
    email: "demo.student@learner.manipal.edu",
    passwordHash: "student123",
    fullName: "Demo Student",
    role: "student" as const,
    department: "Computer Science Engineering",
    yearOfStudy: 2,
  },

  {
    id: 10,
    email: "gdsc@manipal.edu",
    passwordHash: "club123",
    fullName: "GDSC MIT Manipal",
    role: "club_member" as const,
  },
  {
    id: 11,
    email: "music@manipal.edu",
    passwordHash: "club123",
    fullName: "Music Club MIT",
    role: "club_member" as const,
  },

  {
    id: 20,
    email: "swo@manipal.edu",
    passwordHash: "admin123",
    fullName: "Dr. Rajesh Kumar",
    role: "admin" as const,
    department: "Student Affairs",
  },
]

export interface LoginCredentials {
  email?: string
  registrationNumber?: string
  password?: string
  role: "student" | "club_member" | "admin"
  adminId?: string
}

export interface AuthResult {
  success: boolean
  user?: User
  token?: string
  error?: string
}

const delay = (ms: number) => new Promise((resolve) => setTimeout(resolve, ms))

export const authenticate = async (credentials: LoginCredentials): Promise<AuthResult> => {
  await delay(1000)

  try {
    let user = null

    if (credentials.role === "student") {
 
      if (credentials.registrationNumber) {
        user = mockUsers.find((u) => u.registrationNumber === credentials.registrationNumber && u.role === "student")
      } else if (credentials.email) {
        user = mockUsers.find((u) => u.email === credentials.email && u.role === "student")
      }

      if (user) {
        return {
          success: true,
          user: {
            id: user.id,
            registrationNumber: user.registrationNumber,
            email: user.email,
            fullName: user.fullName,
            role: user.role,
            department: user.department,
            yearOfStudy: user.yearOfStudy,
            createdAt: new Date().toISOString(),
            updatedAt: new Date().toISOString(),
          },
          token: `mock-jwt-token-${user.id}`,
        }
      }
    } else if (credentials.role === "club_member") {

      user = mockUsers.find(
        (u) => u.email === credentials.email && u.passwordHash === credentials.password && u.role === "club_member",
      )

      if (user) {
        return {
          success: true,
          user: {
            id: user.id,
            email: user.email,
            fullName: user.fullName,
            role: user.role,
            createdAt: new Date().toISOString(),
            updatedAt: new Date().toISOString(),
          },
          token: `mock-jwt-token-${user.id}`,
        }
      }
    } else if (credentials.role === "admin") {
  
      const adminEmail = `${credentials.adminId}@manipal.edu`
      user = mockUsers.find(
        (u) => u.email === adminEmail && u.passwordHash === credentials.password && u.role === "admin",
      )

      if (user) {
        return {
          success: true,
          user: {
            id: user.id,
            email: user.email,
            fullName: user.fullName,
            role: user.role,
            department: user.department,
            createdAt: new Date().toISOString(),
            updatedAt: new Date().toISOString(),
          },
          token: `mock-jwt-token-${user.id}`,
        }
      }
    }

    return {
      success: false,
      error: "Invalid credentials. Please check your login details and try again.",
    }
  } catch (error) {
    return {
      success: false,
      error: "An error occurred during authentication. Please try again.",
    }
  }
}

export const getCurrentUser = async (token: string): Promise<User | null> => {
  await delay(300)

  const userId = Number.parseInt(token.split("-").pop() || "0")
  const user = mockUsers.find((u) => u.id === userId)

  if (user) {
    return {
      id: user.id,
      registrationNumber: user.registrationNumber,
      email: user.email,
      fullName: user.fullName,
      role: user.role,
      department: user.department,
      yearOfStudy: user.yearOfStudy,
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString(),
    }
  }

  return null
}

export const logout = () => {

  localStorage.removeItem("auth-token")
  localStorage.removeItem("user-data")
}