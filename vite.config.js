import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import path from 'path';
import dns from 'dns'
import dotenv from 'dotenv'

dotenv.config()

dns.setDefaultResultOrder('verbatim')

process.env.CLIENT_ID = process.env.SPA_CLIENT_ID || process.env.CLIENT_ID;

const env = {};

// List of environment variables made available to the app
[
  'VITE_ISSUER',
  'VITE_CLIENT_ID',
  'VITE_EXT_AUTH_URL',
  'VITE_EXT_CLIENT_ID',
  'VITE_EXT_REDIRECT_URI',
  'VITE_LINK_API',
  'VITE_SUPPORT_EMAIL',
  'VITE_SUPPORT_URL',
].forEach((key) => {
  if (!process.env[key]) {
    throw new Error(`Environment variable ${key} must be set. See README.md`);
  }
  env[key] = process.env[key];
});

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  define: {
    'process.env': env
  },
  resolve: {
    alias: {
      'react-router-dom': path.resolve(__dirname, 'node_modules/react-router-dom')
    }
  },
  server: {
    port: process.env.PORT || 3000
  },
  build: {
    rollupOptions: {
      // always throw with build warnings
      onwarn (warning, warn) {
        warn('\nBuild warning happened, customize "onwarn" callback in vite.config.js to handle this error.');
        //throw new Error(warning);
      }
    }
  }
})
