import { defineConfig, loadEnv } from 'vite'
import react from '@vitejs/plugin-react'
import path from 'path';
import dotenv from 'dotenv'


// https://vitejs.dev/config/
export default defineConfig(({ _, mode }) => {
  dotenv.config({path: '.okta.env'})

  const env = loadEnv(mode, process.cwd(), '')

//  if (!env.ISSUER || !env.CLIENT_ID) {
//    throw new Error(`Set ISSUER and CLIENT_ID in .okta.env`)
//  }

  const customEnv = {}

  const variables = [
      'ISSUER',
      'CLIENT_ID',
      'EXT_AUTH_URL',
      'EXT_CLIENT_ID',
      'EXT_REDIRECT_URI',
      'LINK_API',
      'SUPPORT_EMAIL',
      'SUPPORT_URL'
  ]

  variables.forEach((key) => {
    if (!env[key]) {
      throw new Error(`Environment variable ${key} must be set`)
    }
    customEnv[key] = env[key]
  })

  return {
    plugins: [react()],
    resolve: {
      alias: {
        'react-router-dom': path.resolve(__dirname, 'node_modules/react-router-dom')
      }
    },
    define: {
      'process.env': customEnv
    },
    test: {
      environment: 'jsdom',
      globals: true
    },
    server: {
      port: env.PORT || 3000
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
  }

})
