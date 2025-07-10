import path from 'path';

/** @type {import('next').NextConfig} */
const nextConfig = {
  eslint: {
    ignoreDuringBuilds: true,
  },
  typescript: {
    ignoreBuildErrors: true,
  },
  images: {
    unoptimized: true,
  },
  output: 'export',

  // 👇 Add this to properly resolve @/ alias for Webpack (needed in Docker builds)
  webpack: (config) => {
    config.resolve.alias['@'] = path.resolve('./');
    return config;
  },
};

export default nextConfig;
