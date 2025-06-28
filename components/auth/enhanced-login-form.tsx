"use client"

import type React from "react"

import { useState } from "react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Separator } from "@/components/ui/separator"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { Alert, AlertDescription } from "@/components/ui/alert"
import { User, Building, Shield, Loader2, AlertCircle, Eye, EyeOff, UserPlus, Mail } from "lucide-react"
import { useToast } from "@/hooks/use-toast"
import { AnimatedBackground } from "@/components/ui/animated-background"
import FallingLeaves from "@/components/ui/FallingLeaves"
import { supabase } from "@/lib/supabase"
import { sendConfirmationEmail } from "@/lib/email-confirmation"

interface EnhancedLoginFormProps {
  onLogin: (role: string, user: any) => void
  onSignupClick: () => void
}

export function EnhancedLoginForm({ onLogin, onSignupClick }: EnhancedLoginFormProps) {
  const [userRole, setUserRole] = useState<"student" | "club_member" | "admin">("student")
  const [loading, setLoading] = useState(false)
  const [sendingEmail, setSendingEmail] = useState(false)
  const [showPassword, setShowPassword] = useState(false)
  const [error, setError] = useState("")
  const [emailSent, setEmailSent] = useState(false)
  const [formData, setFormData] = useState({
    registrationNumber: "",
    email: "",
    password: "",
    adminId: "",
  })
  const { toast } = useToast()

  const handleInputChange = (field: string, value: string) => {
    setFormData((prev) => ({ ...prev, [field]: value }))
    if (error) setError("") // Clear error when user starts typing
    if (field === "registrationNumber" && emailSent) {
      setEmailSent(false) // Reset email sent status when registration number changes
    }
  }

  const handleStudentLogin = async () => {
    if (!formData.registrationNumber && !formData.email) {
      setError("Please enter your registration number or email")
      return
    }

    if (formData.registrationNumber) {
      setSendingEmail(true)
      setError("")

      try {
        const result = await sendConfirmationEmail(formData.registrationNumber)

        if (result.success) {
          setEmailSent(true)
          toast({
            title: "Email Sent!",
            description: `Confirmation email has been sent to ${result.email}`,
          })
        } else {
          setError(result.error || 'Failed to send confirmation email')
          toast({
            title: "Email Failed",
            description: result.error || 'Failed to send confirmation email',
            variant: "destructive",
          })
        }
      } catch (error) {
        const errorMessage = "Failed to send confirmation email. Please try again."
        setError(errorMessage)
        toast({
          title: "Error",
          description: errorMessage,
          variant: "destructive",
        })
      } finally {
        setSendingEmail(false)
      }
      return
    }

    if (formData.email) {
      setSendingEmail(true)
      setError("")

      try {

        const { data: userData, error } = await supabase
          .from("users")
          .select("*")
          .eq("email", formData.email)
          .eq("role", "student")
          .single()

        if (userData && !error) {

          const result = await sendConfirmationEmail(formData.email)

          if (result.success) {
            setEmailSent(true)
            toast({
              title: "Email Sent!",
              description: `Confirmation email has been sent to ${result.email}`,
            })
          } else {
            setError(result.error || 'Failed to send confirmation email')
            toast({
              title: "Email Failed",
              description: result.error || 'Failed to send confirmation email',
              variant: "destructive",
            })
          }
        } else {
          setError("Student not found with this email address.")
          toast({
            title: "Login Failed",
            description: "Student not found with this email address.",
            variant: "destructive",
          })
        }
      } catch (error) {
        const errorMessage = "Failed to send confirmation email. Please try again."
        setError(errorMessage)
        toast({
          title: "Error",
          description: errorMessage,
          variant: "destructive",
        })
      } finally {
        setSendingEmail(false)
      }
      return
    }
  }

  const validateForm = (): boolean => {
    if (userRole === "student") {
      if (!formData.registrationNumber && !formData.email) {
        setError("Please enter your registration number or email")
        return false
      }
    } else if (userRole === "club_member") {
      if (!formData.email || !formData.password) {
        setError("Please enter both email and password")
        return false
      }
    } else if (userRole === "admin") {
      if (!formData.adminId || !formData.password) {
        setError("Please enter both admin ID and password")
        return false
      }
    }
    return true
  }

  const handleLogin = async () => {
    if (userRole === "student") {
      await handleStudentLogin()
      return
    }

    if (!validateForm()) return

    setLoading(true)
    setError("")

    try {
      let userProfile = null
      let role = userRole
      let email = formData.email
      let password = formData.password
      let loginSuccess = false
      let errorMsg = "Invalid credentials. Please try again."

      if (userRole === "club_member" || userRole === "admin") {

        let loginEmail = formData.email
        if (userRole === "admin") {

          const { data: adminUser, error } = await supabase
            .from("admins")
            .select("user_id")
            .eq("admin_id", formData.adminId)
            .single()
          if (adminUser && !error) {
     
            const { data: user, error: userError } = await supabase
              .from("users")
              .select("*")
              .eq("id", adminUser.user_id)
              .single()
            if (user && !userError) {
              loginEmail = user.email
              userProfile = user
            }
          }
        } else {
   
          const { data: user, error } = await supabase
            .from("users")
            .select("*")
            .eq("email", formData.email)
            .eq("role", "club_member")
            .single()
          if (user && !error) {
            userProfile = user
          }
        }

        if (loginEmail && password) {
          const { data: authData, error: authError } = await supabase.auth.signInWithPassword({
            email: loginEmail,
            password
          })
          if (authData.session && !authError && userProfile) {
            loginSuccess = true
          } else {
            errorMsg = authError?.message || errorMsg
          }
        }
      }

      if (loginSuccess && userProfile) {

        localStorage.setItem("user-data", JSON.stringify(userProfile))

        onLogin(userProfile.role, {
          ...userProfile,
          fullName: userProfile.full_name,
          email: userProfile.email,
          profileImageUrl: userProfile.profile_image_url
        })
      } else {
        setError(errorMsg)
        toast({
          title: "Login Failed",
          description: errorMsg,
          variant: "destructive",
        })
      }
    } catch (error) {
      const errorMessage = "Something went wrong. Please try again."
      setError(errorMessage)
      toast({
        title: "Error",
        description: errorMessage,
        variant: "destructive",
      })
    } finally {
      setLoading(false)
    }
  }

  const handleKeyPress = (e: React.KeyboardEvent) => {
    if (e.key === "Enter") {
      handleLogin()
    }
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-green-200 via-green-100 to-emerald-100 dark:from-gray-900 dark:via-gray-800 dark:to-gray-900 transition-colors duration-500" style={{position: 'relative'}}>
      <FallingLeaves />
      <Card className="login-card animate-fade-in-up max-w-md w-full rounded-3xl shadow-2xl bg-white/60 dark:bg-gray-900/80 backdrop-blur-xl border-0 p-8">
        <CardHeader className="text-center pb-8">
          <div className="flex justify-center mb-6">
            <img
              src="/title.png"
              alt="NexusSync Logo"
              className="w-full max-w-[85%] h-auto object-contain mx-auto"
              style={{ display: 'block' }}
            />
          </div>
          <CardDescription
            className="text-2xl font-extrabold text-black dark:text-white drop-shadow-lg tracking-tight mt-4 mb-2"
          >
            MIT Manipal Club Management Platform
          </CardDescription>
        </CardHeader>
        <CardContent>
          {error && (
            <Alert variant="destructive" className="mb-6 animate-fade-in-up bg-gradient-to-r from-pink-100 via-red-100 to-pink-50 dark:from-red-900 dark:via-pink-900 dark:to-red-800 border-l-8 border-red-500 shadow-xl rounded-xl flex items-center gap-4 p-4">
              <AlertCircle className="h-7 w-7 text-red-500" />
              <AlertDescription className="font-semibold text-red-900 dark:text-red-100 text-base">{error}</AlertDescription>
            </Alert>
          )}

          {emailSent && (
            <Alert className="mb-6 animate-fade-in-up bg-gradient-to-r from-green-100 via-emerald-100 to-green-50 dark:from-green-900 dark:via-emerald-900 dark:to-green-800 border-l-8 border-green-500 shadow-xl rounded-xl flex items-center gap-4 p-4">
              <Mail className="h-7 w-7 text-green-500" />
              <AlertDescription className="font-semibold text-green-900 dark:text-green-100 text-base">
                Confirmation email sent! Please check your inbox and click the link to access your dashboard.
              </AlertDescription>
            </Alert>
          )}

          <Tabs value={userRole} onValueChange={(value) => setUserRole(value as any)} className="w-full">
            <TabsList className="admin-tabs-list grid w-full grid-cols-3 mb-8 bg-gradient-to-r from-green-400 via-green-500 to-emerald-400 rounded-xl p-1 shadow-md">
              <TabsTrigger value="student" className="admin-tabs-trigger text-sm font-semibold text-white data-[state=active]:bg-white data-[state=active]:text-green-700 data-[state=active]:shadow-lg data-[state=active]:rounded-xl rounded-lg transition-all duration-200 hover:bg-white/30 focus:ring-2 focus:ring-green-300">
                <User className="w-5 h-5 mr-1" />
                Student
              </TabsTrigger>
              <TabsTrigger value="club_member" className="admin-tabs-trigger text-sm font-semibold text-white data-[state=active]:bg-white data-[state=active]:text-green-700 data-[state=active]:shadow-lg data-[state=active]:rounded-xl rounded-lg transition-all duration-200 hover:bg-white/30 focus:ring-2 focus:ring-green-300">
                <Building className="w-5 h-5 mr-1" />
                Club
              </TabsTrigger>
              <TabsTrigger value="admin" className="admin-tabs-trigger text-sm font-semibold text-white data-[state=active]:bg-white data-[state=active]:text-green-700 data-[state=active]:shadow-lg data-[state=active]:rounded-xl rounded-lg transition-all duration-200 hover:bg-white/30 focus:ring-2 focus:ring-green-300">
                <Shield className="w-5 h-5 mr-1" />
                Admin
              </TabsTrigger>
            </TabsList>

            <TabsContent value="student" className="space-y-6 animate-slide-up">
              <div className="space-y-2">
                <Label htmlFor="reg-number" className="text-sm font-medium text-green-900 dark:text-green-200">Registration Number</Label>
                <div className="relative">
                  <User className="absolute left-3 top-3 h-5 w-5 text-green-300" />
                  <Input
                    id="reg-number"
                    placeholder="e.g., 220701001"
                    value={formData.registrationNumber}
                    onChange={(e) => handleInputChange("registrationNumber", e.target.value)}
                    onKeyPress={handleKeyPress}
                    className={`signup-input h-12 pl-10 rounded-xl border transition-colors duration-200 focus:border-green-500 placeholder:font-normal placeholder:text-gray-400 bg-white/80 dark:bg-gray-900/60 ${formData.registrationNumber ? 'border-green-500' : ''}`}
                  />
                </div>
                <p className="text-xs text-gray-500 dark:text-gray-400">
                  Enter your registration number to receive a confirmation email
                </p>
              </div>
              <div className="flex items-center space-x-2">
                <Separator className="flex-1" />
                <span className="text-xs text-gray-400">OR</span>
                <Separator className="flex-1" />
              </div>
              <div className="space-y-2">
                <Label htmlFor="email" className="text-sm font-medium text-green-900 dark:text-green-200">Email</Label>
                <div className="relative">
                  <User className="absolute left-3 top-3 h-5 w-5 text-green-300" />
                  <Input
                    id="email"
                    type="email"
                    placeholder="your.email@learner.manipal.edu"
                    value={formData.email}
                    onChange={(e) => handleInputChange("email", e.target.value)}
                    onKeyPress={handleKeyPress}
                    className={`signup-input h-12 pl-10 rounded-xl border transition-colors duration-200 focus:border-green-500 placeholder:font-normal placeholder:text-gray-400 bg-white/80 dark:bg-gray-900/60 ${formData.email ? 'border-green-500' : ''}`}
                  />
                </div>
                <p className="text-xs text-gray-500 dark:text-gray-400">
                Enter your registered email-id to receive a confirmation email
                </p>
              </div>
              <Button
                className="w-full h-12 bg-gradient-to-r from-green-500 to-emerald-500 hover:from-green-600 hover:to-emerald-600 text-white font-semibold rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 animate-fade-in-up"
                onClick={handleLogin}
                disabled={loading || sendingEmail}
              >
                {loading || sendingEmail ? (
                  <>
                    <Loader2 className="w-4 h-4 mr-2 animate-spin" />
                    {sendingEmail ? "Sending Email..." : "Signing In..."}
                  </>
                ) : (
                  <>
                    <User className="w-4 h-4 mr-2" />
                    {(formData.registrationNumber || formData.email) ? "Send Confirmation Email" : "Login as Student"}
                  </>
                )}
              </Button>
            </TabsContent>

            <TabsContent value="club_member" className="space-y-6 animate-slide-up">
              <div className="space-y-2">
                <Label htmlFor="club-email" className="text-sm font-medium text-green-900 dark:text-green-200">Club Email</Label>
                <div className="relative">
                  <Building className="absolute left-3 top-3 h-5 w-5 text-green-300" />
                  <Input
                    id="club-email"
                    type="email"
                    placeholder="gdsc@manipal.edu"
                    value={formData.email}
                    onChange={(e) => handleInputChange("email", e.target.value)}
                    onKeyPress={handleKeyPress}
                    className={`signup-input h-12 pl-10 rounded-xl border transition-colors duration-200 focus:border-green-500 placeholder:font-normal placeholder:text-gray-400 bg-white/80 dark:bg-gray-900/60 ${formData.email ? 'border-green-500' : ''}`}
                  />
                </div>
              </div>
              <div className="space-y-2">
                <Label htmlFor="club-password" className="text-sm font-medium text-green-900 dark:text-green-200">Password</Label>
                <div className="relative">
                  <Eye className="absolute left-3 top-3 h-5 w-5 text-green-300" />
                  <Input
                    id="club-password"
                    type={showPassword ? "text" : "password"}
                    placeholder="••••••••"
                    value={formData.password}
                    onChange={(e) => handleInputChange("password", e.target.value)}
                    onKeyPress={handleKeyPress}
                    className={`signup-input h-12 pl-10 pr-12 rounded-xl border transition-colors duration-200 focus:border-green-500 placeholder:font-normal placeholder:text-gray-400 bg-white/80 dark:bg-gray-900/60 ${formData.password ? 'border-green-500' : ''}`}
                  />
                  <Button
                    type="button"
                    variant="ghost"
                    size="icon"
                    className="absolute right-0 top-0 h-12 w-12"
                    onClick={() => setShowPassword(!showPassword)}
                  >
                    {showPassword ? <EyeOff className="w-4 h-4" /> : <Eye className="w-4 h-4" />}
                  </Button>
                </div>
              </div>
              <Button
                className="w-full h-12 bg-gradient-to-r from-green-500 to-emerald-500 hover:from-green-600 hover:to-emerald-600 text-white font-semibold rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 animate-fade-in-up"
                onClick={handleLogin}
                disabled={loading}
              >
                {loading ? (
                  <>
                    <Loader2 className="w-4 h-4 mr-2 animate-spin" />
                    Signing In...
                  </>
                ) : (
                  <>
                    <Building className="w-4 h-4 mr-2" />
                    Login as Club
                  </>
                )}
              </Button>
            </TabsContent>

            <TabsContent value="admin" className="space-y-6 animate-slide-up">
              <div className="space-y-2">
                <Label htmlFor="admin-id" className="text-sm font-medium text-green-900 dark:text-green-200">Admin ID</Label>
                <div className="relative">
                  <Shield className="absolute left-3 top-3 h-5 w-5 text-green-300" />
                  <Input
                    id="admin-id"
                    placeholder="e.g., swo"
                    value={formData.adminId}
                    onChange={(e) => handleInputChange("adminId", e.target.value)}
                    onKeyPress={handleKeyPress}
                    className={`signup-input h-12 pl-10 rounded-xl border transition-colors duration-200 focus:border-green-500 placeholder:font-normal placeholder:text-gray-400 bg-white/80 dark:bg-gray-900/60 ${formData.adminId ? 'border-green-500' : ''}`}
                  />
                </div>
              </div>
              <div className="space-y-2">
                <Label htmlFor="admin-password" className="text-sm font-medium text-green-900 dark:text-green-200">Password</Label>
                <div className="relative">
                  <Eye className="absolute left-3 top-3 h-5 w-5 text-green-300" />
                  <Input
                    id="admin-password"
                    type={showPassword ? "text" : "password"}
                    placeholder="••••••••"
                    value={formData.password}
                    onChange={(e) => handleInputChange("password", e.target.value)}
                    onKeyPress={handleKeyPress}
                    className={`signup-input h-12 pl-10 pr-12 rounded-xl border transition-colors duration-200 focus:border-green-500 placeholder:font-normal placeholder:text-gray-400 bg-white/80 dark:bg-gray-900/60 ${formData.password ? 'border-green-500' : ''}`}
                  />
                  <Button
                    type="button"
                    variant="ghost"
                    size="icon"
                    className="absolute right-0 top-0 h-12 w-12"
                    onClick={() => setShowPassword(!showPassword)}
                  >
                    {showPassword ? <EyeOff className="w-4 h-4" /> : <Eye className="w-4 h-4" />}
                  </Button>
                </div>
              </div>
              <Button
                className="w-full h-12 bg-gradient-to-r from-green-500 to-emerald-500 hover:from-green-600 hover:to-emerald-600 text-white font-semibold rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 animate-fade-in-up"
                onClick={handleLogin}
                disabled={loading}
              >
                {loading ? (
                  <>
                    <Loader2 className="w-4 h-4 mr-2 animate-spin" />
                    Signing In...
                  </>
                ) : (
                  <>
                    <Shield className="w-4 h-4 mr-2" />
                    Login as Admin
                  </>
                )}
              </Button>
            </TabsContent>
          </Tabs>

          <div className="mt-8 text-center">
            <p className="text-sm text-green-800 dark:text-green-200 mb-4">Don't have an account?</p>
            <Button variant="outline" onClick={onSignupClick} className="w-full text-green-700 font-semibold rounded-xl border-green-300 bg-white/70 hover:bg-green-100 hover:border-green-500 shadow transition-all duration-200 dark:bg-gray-800 dark:text-green-200 dark:border-green-700 dark:hover:bg-gray-700">
              <UserPlus className="w-4 h-4 mr-2" />
              Create New Account
            </Button>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
