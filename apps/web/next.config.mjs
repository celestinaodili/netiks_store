import path from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

const nextConfig = {
  images: {
    remotePatterns: [
      {
        protocol: "https",
        hostname: "images.unsplash.com",
      },
      {
        protocol: "http",
        hostname: "20.110.37.57", 
      },
    ],
  },
  turbopack: {
    root: path.join(__dirname, "../.."),
  },
};

export default nextConfig;