# Astro Cheatsheet

## Project Structure

```
src/
  pages/          → file-based routing
  layouts/        → layout components
  components/     → UI components (.astro, .jsx, .svelte, etc.)
  content/        → content collections (MD/MDX)
  styles/         → global CSS
public/           → static assets (copied as-is)
astro.config.mjs
```

---

## Component Syntax

```astro
---
// Component Script (runs server-side only)
import OtherComponent from './OtherComponent.astro';
const greeting = "Hello";
const items = ['a', 'b', 'c'];
---

<!-- Template -->
<div>
  <h1>{greeting}</h1>

  {items.map(item => <p>{item}</p>)}

  {true && <span>Shown</span>}
  {false ? <span>No</span> : <span>Yes</span>}

  <OtherComponent />
</div>

<style>
  /* Scoped by default */
  h1 { color: blue; }
</style>

<style is:global>
  /* Global override */
</style>
```

---

## Props

```astro
---
// MyComponent.astro
interface Props {
  title: string;
  count?: number;
}
const { title, count = 0 } = Astro.props;
---
<h1>{title} ({count})</h1>

<!-- Usage -->
<!-- <MyComponent title="Hello" count={5} /> -->
```

---

## Slots

```astro
<!-- Layout.astro -->
<html>
  <body>
    <slot name="header" />
    <slot />
    <slot name="footer">Default footer</slot>
  </body>
</html>

<!-- Usage -->
---
import Layout from './Layout.astro';
---
<Layout>
  <h1 slot="header">Title</h1>
  <p>Body</p>
</Layout>
```

---

## Pages & Routing

```
src/pages/
  index.astro         → /
  about.astro         → /about
  blog/
    index.astro       → /blog
    [slug].astro      → /blog/:slug (dynamic)
    [...path].astro   → /blog/* (catch-all)
  api/
    data.ts           → /api/data (API endpoint)
```

### Dynamic Routes

```astro
---
// [slug].astro
export async function getStaticPaths() {
  return [
    { params: { slug: 'post-1' }, props: { title: 'Post 1' } },
    { params: { slug: 'post-2' }, props: { title: 'Post 2' } },
  ];
}
const { slug } = Astro.params;
const { title } = Astro.props;
---
<h1>{title}</h1>
```

### API Endpoints

```ts
// src/pages/api/hello.ts
import type { APIRoute } from 'astro';

export const GET: APIRoute = ({ params, request }) => {
  return new Response(JSON.stringify({ message: 'Hello' }), {
    headers: { 'Content-Type': 'application/json' }
  });
};

export const POST: APIRoute = async ({ request }) => {
  const body = await request.json();
  return new Response(JSON.stringify(body));
};
```

---

## Data Fetching

```astro
---
// Runs at build time (static) or per-request (SSR)
const response = await fetch('https://api.example.com/data');
const data = await response.json();
---
<ul>
  {data.map(item => <li>{item.name}</li>)}
</ul>
```

---

## Astro.glob & Content Collections

```astro
---
// Legacy glob (still works)
const posts = await Astro.glob('../content/posts/*.md');
---

// Content Collections (preferred)
// src/content/config.ts
import { defineCollection, z } from 'astro:content';

export const collections = {
  blog: defineCollection({
    schema: z.object({
      title: z.string(),
      date: z.date(),
      tags: z.array(z.string()).optional(),
    }),
  }),
};
```

```astro
---
// Using collections
import { getCollection, getEntry } from 'astro:content';

const posts = await getCollection('blog');
const post = await getEntry('blog', 'my-post');
const { Content } = await post.render();
---
<Content />
```

---

## Layouts

```astro
---
// layouts/Base.astro
const { title } = Astro.props;
---
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>{title}</title>
  </head>
  <body>
    <slot />
  </body>
</html>
```

```astro
---
// pages/index.astro
import Base from '../layouts/Base.astro';
---
<Base title="Home">
  <h1>Welcome</h1>
</Base>
```

### Markdown Layout (frontmatter)

```md
---
layout: ../layouts/Post.astro
title: My Post
---
# Content here
```

---

## UI Frameworks (Islands)

```js
// astro.config.mjs
import { defineConfig } from 'astro/config';
import react from '@astrojs/react';
import svelte from '@astrojs/svelte';

export default defineConfig({
  integrations: [react(), svelte()],
});
```

```astro
---
import ReactCounter from '../components/Counter.jsx';
import SvelteWidget from '../components/Widget.svelte';
---

<!-- Static (no JS) -->
<ReactCounter />

<!-- Hydration directives -->
<ReactCounter client:load />      <!-- Hydrate immediately -->
<ReactCounter client:idle />      <!-- Hydrate when idle -->
<ReactCounter client:visible />   <!-- Hydrate when visible -->
<ReactCounter client:media="(max-width: 600px)" />
<SvelteWidget client:only="svelte" />  <!-- Skip SSR entirely -->
```

---

## Styles & CSS

```astro
<!-- Scoped (default) -->
<style>
  p { color: red; }
</style>

<!-- Global -->
<style is:global>
  body { margin: 0; }
</style>

<!-- Import CSS -->
---
import '../styles/global.css';
---

<!-- Inline conditional class -->
<p class:list={['base', { active: isActive }, maybeClass]}>

<!-- Tailwind (after adding @astrojs/tailwind integration) -->
<p class="text-red-500 font-bold">
```

---

## SSR Mode

```js
// astro.config.mjs
export default defineConfig({
  output: 'server', // 'static' | 'hybrid' | 'server'
  adapter: node({ mode: 'standalone' }),
});
```

```astro
---
// Opt-out of prerendering in hybrid mode
export const prerender = false;

// Access request in SSR
const cookie = Astro.cookies.get('session');
const url = Astro.url;
const headers = Astro.request.headers;

// Redirect
return Astro.redirect('/login');
---
```

---

## Astro.* API Reference

| API | Description |
|-----|-------------|
| `Astro.props` | Component props |
| `Astro.params` | URL params (dynamic routes) |
| `Astro.url` | Current URL object |
| `Astro.site` | Site URL from config |
| `Astro.request` | Request object (SSR) |
| `Astro.response` | Response object (SSR) |
| `Astro.redirect(url)` | Redirect (SSR) |
| `Astro.cookies` | Cookie helpers (SSR) |
| `Astro.locals` | Request-scoped data (SSR) |
| `Astro.glob(pattern)` | Import multiple files |

---

## astro.config.mjs Common Options

```js
import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://mysite.com',
  base: '/subpath',          // for subdirectory deploys
  output: 'static',          // static | server | hybrid
  integrations: [],
  vite: {
    plugins: [],
    define: { 'import.meta.env.MY_VAR': '"value"' }
  },
  markdown: {
    shikiConfig: { theme: 'dracula' },
    remarkPlugins: [],
    rehypePlugins: [],
  },
  image: {
    service: { entrypoint: 'astro/assets/services/sharp' }
  }
});
```

---

## Image Optimization

```astro
---
import { Image, Picture } from 'astro:assets';
import localImage from '../assets/photo.jpg';
---

<Image src={localImage} alt="Photo" width={800} height={600} />
<Image src="https://example.com/img.png" alt="Remote" width={400} height={300} />
<Picture src={localImage} alt="Photo" formats={['avif', 'webp']} />
```

---

## Middleware

```ts
// src/middleware.ts
import { defineMiddleware } from 'astro:middleware';

export const onRequest = defineMiddleware((context, next) => {
  context.locals.user = getUser(context.request);
  return next();
});
```