import "./globals.css"

export const metadata = {
  title: 'C.Service - Hublots CM',
  description: 'Gestionnaire de Services clients de la société Hublots CM',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
