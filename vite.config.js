import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  plugins: [
    react(),
  ],
  optimizeDeps: {
    // Exclude ReScript packages from pre-bundling as they're already ES modules
    exclude: ['@rescript/core', '@rescript/react'],
  },
  build: {
    minify: 'terser',
    terserOptions: {
      compress: {
        drop_console: true,
        drop_debugger: true,
      },
    },
  },
});
