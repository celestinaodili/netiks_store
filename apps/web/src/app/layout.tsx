import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Netiks Store",
  description: "A multi-vendor marketplace for modern work essentials",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body>
        {children}
        <footer style={{ textAlign: "center", padding: "8px", fontSize: "15px", color: "#2b1313" }}>
          © 2026, Netiks Store. All rights reserved.
        </footer>
      </body>
    </html>
  );
}
