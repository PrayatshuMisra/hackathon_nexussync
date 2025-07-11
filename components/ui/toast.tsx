"use client"

import * as React from "react"
import * as ToastPrimitives from "@radix-ui/react-toast"
import { cva, type VariantProps } from "class-variance-authority"
import { X } from "lucide-react"

import { cn } from "@/lib/utils"

const ToastProvider = ToastPrimitives.Provider

const ToastViewport = React.forwardRef<
  React.ElementRef<typeof ToastPrimitives.Viewport>,
  React.ComponentPropsWithoutRef<typeof ToastPrimitives.Viewport>
>(({ className, ...props }, ref) => (
  <ToastPrimitives.Viewport
    ref={ref}
    className={cn(
      "fixed top-0 z-[100] flex max-h-screen w-full flex-col-reverse p-4 sm:bottom-0 sm:right-0 sm:top-auto sm:flex-col md:max-w-[420px]",
      className,
    )}
    {...props}
  />
))
ToastViewport.displayName = ToastPrimitives.Viewport.displayName

const toastVariants = cva(
  "group pointer-events-auto relative flex w-full items-center justify-between space-x-4 overflow-hidden rounded-md border p-6 pr-8 shadow-lg transition-all data-[swipe=cancel]:translate-x-0 data-[swipe=end]:translate-x-[var(--radix-toast-swipe-end-x)] data-[swipe=move]:translate-x-[var(--radix-toast-swipe-move-x)] data-[swipe=move]:transition-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[swipe=end]:animate-out data-[state=closed]:fade-out-80 data-[state=closed]:slide-out-to-right-full data-[state=open]:slide-in-from-top-full data-[state=open]:sm:slide-in-from-bottom-full backdrop-blur-sm",
  {
    variants: {
      variant: {
        default: "border-gray-200 bg-white/95 text-gray-900 dark:border-gray-700 dark:bg-gray-900/95 dark:text-gray-100 shadow-xl",
        destructive:
          "destructive group border-red-300 bg-red-100/95 text-red-900 dark:border-red-600 dark:bg-red-900/95 dark:text-red-100 shadow-xl",
        success:
          "border-green-300 bg-green-100/95 text-green-900 dark:border-green-600 dark:bg-green-900/95 dark:text-green-100 shadow-xl",
        warning:
          "border-yellow-300 bg-yellow-100/95 text-yellow-900 dark:border-yellow-600 dark:bg-yellow-900/95 dark:text-yellow-100 shadow-xl",
        info:
          "border-blue-300 bg-blue-100/95 text-blue-900 dark:border-blue-600 dark:bg-blue-900/95 dark:text-blue-100 shadow-xl",
      },
    },
    defaultVariants: {
      variant: "default",
    },
  },
)

const Toast = React.forwardRef<
  React.ElementRef<typeof ToastPrimitives.Root>,
  React.ComponentPropsWithoutRef<typeof ToastPrimitives.Root> & VariantProps<typeof toastVariants>
>(({ className, variant, ...props }, ref) => {
  return <ToastPrimitives.Root ref={ref} className={cn(toastVariants({ variant }), className)} {...props} />
})
Toast.displayName = ToastPrimitives.Root.displayName

const ToastAction = React.forwardRef<
  React.ElementRef<typeof ToastPrimitives.Action>,
  React.ComponentPropsWithoutRef<typeof ToastPrimitives.Action>
>(({ className, ...props }, ref) => (
  <ToastPrimitives.Action
    ref={ref}
    className={cn(
      "inline-flex h-8 shrink-0 items-center justify-center rounded-md border bg-transparent px-3 text-sm font-medium ring-offset-background transition-colors hover:bg-secondary focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 group-[.destructive]:border-muted/40 group-[.destructive]:hover:border-destructive/30 group-[.destructive]:hover:bg-destructive group-[.destructive]:hover:text-destructive-foreground group-[.destructive]:focus:ring-destructive",
      className,
    )}
    {...props}
  />
))
ToastAction.displayName = ToastPrimitives.Action.displayName

const ToastClose = React.forwardRef<
  React.ElementRef<typeof ToastPrimitives.Close>,
  React.ComponentPropsWithoutRef<typeof ToastPrimitives.Close>
>(({ className, ...props }, ref) => (
  <ToastPrimitives.Close
    ref={ref}
    className={cn(
      "absolute right-2 top-2 rounded-md p-1 text-gray-500 opacity-0 transition-opacity hover:text-gray-700 hover:bg-gray-100 focus:opacity-100 focus:outline-none focus:ring-2 focus:ring-gray-400 group-hover:opacity-100 dark:text-gray-400 dark:hover:text-gray-200 dark:hover:bg-gray-800 dark:focus:ring-gray-600 group-[.destructive]:text-red-500 group-[.destructive]:hover:text-red-700 group-[.destructive]:hover:bg-red-100 group-[.destructive]:focus:ring-red-400 group-[.destructive]:dark:text-red-400 group-[.destructive]:dark:hover:text-red-200 group-[.destructive]:dark:hover:bg-red-900/50 group-[.success]:text-green-500 group-[.success]:hover:text-green-700 group-[.success]:hover:bg-green-100 group-[.success]:focus:ring-green-400 group-[.success]:dark:text-green-400 group-[.success]:dark:hover:text-green-200 group-[.success]:dark:hover:bg-green-900/50 group-[.warning]:text-yellow-500 group-[.warning]:hover:text-yellow-700 group-[.warning]:hover:bg-yellow-100 group-[.warning]:focus:ring-yellow-400 group-[.warning]:dark:text-yellow-400 group-[.warning]:dark:hover:text-yellow-200 group-[.warning]:dark:hover:bg-yellow-900/50 group-[.info]:text-blue-500 group-[.info]:hover:text-blue-700 group-[.info]:hover:bg-blue-100 group-[.info]:focus:ring-blue-400 group-[.info]:dark:text-blue-400 group-[.info]:dark:hover:text-blue-200 group-[.info]:dark:hover:bg-blue-900/50",
      className,
    )}
    toast-close=""
    {...props}
  >
    <X className="h-4 w-4" />
  </ToastPrimitives.Close>
))
ToastClose.displayName = ToastPrimitives.Close.displayName

const ToastTitle = React.forwardRef<
  React.ElementRef<typeof ToastPrimitives.Title>,
  React.ComponentPropsWithoutRef<typeof ToastPrimitives.Title>
>(({ className, ...props }, ref) => (
  <ToastPrimitives.Title ref={ref} className={cn("text-sm font-semibold", className)} {...props} />
))
ToastTitle.displayName = ToastPrimitives.Title.displayName

const ToastDescription = React.forwardRef<
  React.ElementRef<typeof ToastPrimitives.Description>,
  React.ComponentPropsWithoutRef<typeof ToastPrimitives.Description>
>(({ className, ...props }, ref) => (
  <ToastPrimitives.Description ref={ref} className={cn("text-sm opacity-90", className)} {...props} />
))
ToastDescription.displayName = ToastPrimitives.Description.displayName

type ToastProps = React.ComponentPropsWithoutRef<typeof Toast>

type ToastActionElement = React.ReactElement<typeof ToastAction>

export {
  type ToastProps,
  type ToastActionElement,
  ToastProvider,
  ToastViewport,
  Toast,
  ToastTitle,
  ToastDescription,
  ToastClose,
  ToastAction,
}
