// @ts-check
import { defineConfig, envField } from 'astro/config';
import { fileURLToPath } from 'url';
import path from 'path';

import svelte from '@astrojs/svelte';
import tailwindcss from '@tailwindcss/vite';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

// https://astro.build/config
export default defineConfig({
  integrations: [svelte()],
  env: {
    schema: {
      CMS_API: envField.string({context: 'server', access: 'public', optional: true})
    }
  },
  vite: {
    plugins: [tailwindcss()],
    resolve: {
      alias: {
        '@cms': path.resolve(__dirname, './cms/src'),
      },
    },
  },
});