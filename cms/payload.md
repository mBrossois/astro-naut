# Payload CMS Cheatsheet

## Setup & Config

```ts
// payload.config.ts
import { buildConfig } from 'payload/config';
import { mongooseAdapter } from '@payloadcms/db-mongodb';
import { lexicalEditor } from '@payloadcms/richtext-lexical';

export default buildConfig({
  serverURL: process.env.PAYLOAD_PUBLIC_SERVER_URL,
  secret: process.env.PAYLOAD_SECRET,
  db: mongooseAdapter({ url: process.env.DATABASE_URI }),
  editor: lexicalEditor({}),
  admin: {
    user: 'users',
    meta: { titleSuffix: '— My App' },
  },
  collections: [/* ... */],
  globals: [/* ... */],
  plugins: [],
  cors: ['http://localhost:3000'],
  csrf: ['http://localhost:3000'],
});
```

---

## Collections

```ts
// collections/Posts.ts
import { CollectionConfig } from 'payload/types';

export const Posts: CollectionConfig = {
  slug: 'posts',
  admin: {
    useAsTitle: 'title',
    defaultColumns: ['title', 'status', 'createdAt'],
    group: 'Content',
  },
  access: {
    read: () => true,
    create: ({ req }) => req.user?.role === 'admin',
    update: ({ req, id }) => req.user?.id === id,
    delete: ({ req }) => req.user?.role === 'admin',
  },
  hooks: {
    beforeChange: [addSlug],
    afterChange: [revalidateCache],
    beforeRead: [],
    afterRead: [],
    beforeDelete: [],
    afterDelete: [],
  },
  versions: {
    drafts: true,
    maxPerDoc: 10,
  },
  fields: [/* ... */],
};
```

---

## Fields

### Basic Fields

```ts
fields: [
  // Text
  { name: 'title', type: 'text', required: true },

  // Textarea
  { name: 'bio', type: 'textarea' },

  // Number
  { name: 'price', type: 'number', min: 0, max: 1000 },

  // Email
  { name: 'email', type: 'email' },

  // Checkbox
  { name: 'published', type: 'checkbox', defaultValue: false },

  // Date
  { name: 'publishedAt', type: 'date', admin: { date: { pickerAppearance: 'dayAndTime' } } },

  // Select
  {
    name: 'status',
    type: 'select',
    options: [
      { label: 'Draft', value: 'draft' },
      { label: 'Published', value: 'published' },
    ],
    defaultValue: 'draft',
  },

  // Radio
  { name: 'layout', type: 'radio', options: ['full', 'half', 'third'] },

  // Slug
  { name: 'slug', type: 'text', admin: { readOnly: true } },

  // Rich Text
  { name: 'content', type: 'richText' },

  // Code
  { name: 'snippet', type: 'code', admin: { language: 'typescript' } },

  // JSON
  { name: 'meta', type: 'json' },

  // Point (geo)
  { name: 'location', type: 'point' },
]
```

### Relationship Fields

```ts
// Relationship (single)
{
  name: 'author',
  type: 'relationship',
  relationTo: 'users',
  required: true,
}

// Relationship (multiple collections - polymorphic)
{
  name: 'reference',
  type: 'relationship',
  relationTo: ['posts', 'pages'],
  hasMany: false,
}

// Relationship (has many)
{
  name: 'tags',
  type: 'relationship',
  relationTo: 'tags',
  hasMany: true,
}

// Upload (media)
{
  name: 'image',
  type: 'upload',
  relationTo: 'media',
}
```

### Layout Fields

```ts
// Group
{
  name: 'seo',
  type: 'group',
  fields: [
    { name: 'title', type: 'text' },
    { name: 'description', type: 'textarea' },
  ],
}

// Array
{
  name: 'slides',
  type: 'array',
  minRows: 1,
  maxRows: 10,
  fields: [
    { name: 'image', type: 'upload', relationTo: 'media' },
    { name: 'caption', type: 'text' },
  ],
}

// Blocks (flexible content)
{
  name: 'layout',
  type: 'blocks',
  blocks: [HeroBlock, TextBlock, ImageBlock],
}

// Tabs
{
  type: 'tabs',
  tabs: [
    {
      label: 'Content',
      fields: [{ name: 'title', type: 'text' }],
    },
    {
      name: 'meta', // named tabs become a group in data
      label: 'SEO',
      fields: [{ name: 'description', type: 'textarea' }],
    },
  ],
}

// Collapsible
{
  type: 'collapsible',
  label: 'Advanced',
  fields: [{ name: 'advanced', type: 'text' }],
}

// Row
{
  type: 'row',
  fields: [
    { name: 'firstName', type: 'text', admin: { width: '50%' } },
    { name: 'lastName', type: 'text', admin: { width: '50%' } },
  ],
}
```

### Conditional Fields

```ts
{
  name: 'customUrl',
  type: 'text',
  admin: {
    condition: (data, siblingData) => siblingData.linkType === 'custom',
  },
}
```

---

## Blocks

```ts
// blocks/Hero.ts
import { Block } from 'payload/types';

export const HeroBlock: Block = {
  slug: 'hero',
  labels: { singular: 'Hero', plural: 'Heroes' },
  fields: [
    { name: 'heading', type: 'text', required: true },
    { name: 'subheading', type: 'text' },
    { name: 'image', type: 'upload', relationTo: 'media' },
    {
      name: 'cta',
      type: 'group',
      fields: [
        { name: 'label', type: 'text' },
        { name: 'url', type: 'text' },
      ],
    },
  ],
};
```

---

## Globals

```ts
import { GlobalConfig } from 'payload/types';

export const SiteSettings: GlobalConfig = {
  slug: 'site-settings',
  fields: [
    { name: 'siteName', type: 'text' },
    { name: 'logo', type: 'upload', relationTo: 'media' },
    {
      name: 'nav',
      type: 'array',
      fields: [
        { name: 'label', type: 'text' },
        { name: 'url', type: 'text' },
      ],
    },
  ],
};
```

---

## Access Control

```ts
import { Access } from 'payload/types';

// Common patterns
const isAdmin: Access = ({ req }) => req.user?.role === 'admin';
const isLoggedIn: Access = ({ req }) => Boolean(req.user);
const isOwner: Access = ({ req, id }) => req.user?.id === id;
const isPublished: Access = ({ req, doc }) => {
  if (req.user) return true; // logged in sees all
  return doc?.status === 'published';
};

// Field-level access
{
  name: 'password',
  type: 'text',
  access: {
    read: () => false,  // never return in API
    create: () => true,
    update: isOwner,
  },
}
```

---

## Hooks

```ts
import { CollectionBeforeChangeHook, CollectionAfterChangeHook } from 'payload/types';

// Before change — modify data
const addSlug: CollectionBeforeChangeHook = ({ data, req, operation }) => {
  if (operation === 'create' || data.title) {
    data.slug = data.title.toLowerCase().replace(/\s+/g, '-');
  }
  return data;
};

// After change — side effects
const revalidateCache: CollectionAfterChangeHook = async ({ doc, req }) => {
  await fetch(`/api/revalidate?path=/blog/${doc.slug}`);
  return doc;
};

// Before read — modify query
const addDefaultFilter = ({ query }) => {
  query.where = { ...query.where, status: { equals: 'published' } };
  return query;
};
```

---

## Local API (server-side)

```ts
import payload from 'payload';

// Find
const posts = await payload.find({
  collection: 'posts',
  where: { status: { equals: 'published' } },
  sort: '-createdAt',
  limit: 10,
  page: 1,
  depth: 2,          // how deep to populate relationships
  draft: false,
  locale: 'en',
});
// posts.docs, posts.totalDocs, posts.page, posts.totalPages

// Find by ID
const post = await payload.findByID({
  collection: 'posts',
  id: '123',
  depth: 1,
});

// Create
const newPost = await payload.create({
  collection: 'posts',
  data: { title: 'New Post', status: 'draft' },
});

// Update
const updated = await payload.update({
  collection: 'posts',
  id: '123',
  data: { title: 'Updated' },
});

// Delete
await payload.delete({ collection: 'posts', id: '123' });

// Global
const settings = await payload.findGlobal({ slug: 'site-settings' });
await payload.updateGlobal({ slug: 'site-settings', data: { siteName: 'New Name' } });
```

---

## REST API

```
Base URL: /api

Collections:
  GET    /api/{collection}              → find
  GET    /api/{collection}/{id}         → findByID
  POST   /api/{collection}             → create
  PATCH  /api/{collection}/{id}        → update
  DELETE /api/{collection}/{id}        → delete

Globals:
  GET   /api/globals/{slug}
  POST  /api/globals/{slug}

Auth:
  POST  /api/users/login
  POST  /api/users/logout
  GET   /api/users/me
  POST  /api/users/refresh-token
  POST  /api/users/forgot-password
  POST  /api/users/reset-password

Query Params:
  ?where[field][operator]=value
  ?sort=fieldName or ?sort=-fieldName (desc)
  ?limit=10&page=2
  ?depth=2
  ?draft=true
  ?locale=en&fallbackLocale=all
  ?select[title]=true&select[slug]=true
```

---

## REST API Query Operators

```
equals       → { field: { equals: value } }
not_equals   → { field: { not_equals: value } }
greater_than / less_than
greater_than_equal / less_than_equal
like         → contains string (case-insensitive)
contains     → contains string
in           → { field: { in: [1, 2, 3] } }
not_in
all          → array contains all
exists       → { field: { exists: true } }
near         → geo: { location: { near: [lng, lat, maxDist, minDist] } }

// AND / OR
?where[or][0][status][equals]=published
  &where[or][1][author][equals]=userId
```

---

## Authentication

```ts
// Collection with auth
export const Users: CollectionConfig = {
  slug: 'users',
  auth: {
    tokenExpiration: 7200,  // seconds
    verify: false,          // email verification
    maxLoginAttempts: 5,
    lockTime: 600000,       // ms
    useAPIKey: true,        // enable API keys
    depth: 2,
    cookies: {
      secure: true,
      sameSite: 'Lax',
    },
  },
  fields: [
    { name: 'role', type: 'select', options: ['admin', 'editor', 'user'] },
    { name: 'name', type: 'text' },
  ],
};
```

---

## Upload Collection (Media)

```ts
export const Media: CollectionConfig = {
  slug: 'media',
  upload: {
    staticURL: '/media',
    staticDir: 'media',
    mimeTypes: ['image/*', 'application/pdf'],
    imageSizes: [
      { name: 'thumbnail', width: 400, height: 300, crop: 'centre' },
      { name: 'card', width: 768, height: 1024 },
      { name: 'hero', width: 1920, height: undefined }, // auto height
    ],
    adminThumbnail: 'thumbnail',
    disableLocalStorage: false,
  },
  fields: [
    { name: 'alt', type: 'text' },
    { name: 'caption', type: 'text' },
  ],
};
```

---

## Versions & Drafts

```ts
// In collection config
versions: {
  drafts: {
    autosave: {
      interval: 2000, // ms
    },
  },
  maxPerDoc: 25,
}

// Query drafts via API
const drafts = await payload.find({
  collection: 'posts',
  draft: true,
  overrideAccess: false,
  user: req.user,
});

// REST: ?draft=true
// Publish: set status to 'published' and _status to 'published'
```

---

## Localization

```ts
// In payload.config.ts
localization: {
  locales: [
    { label: 'English', code: 'en' },
    { label: 'French', code: 'fr' },
  ],
  defaultLocale: 'en',
  fallback: true,
}

// In field config
{ name: 'title', type: 'text', localized: true }

// Query
await payload.find({ collection: 'posts', locale: 'fr', fallbackLocale: 'en' })
// REST: ?locale=fr&fallbackLocale=en
```

---

## Custom Endpoints

```ts
// In collection config
endpoints: [
  {
    path: '/publish/:id',
    method: 'post',
    handler: async (req, res) => {
      const { id } = req.params;
      await req.payload.update({
        collection: 'posts',
        id,
        data: { status: 'published' },
      });
      res.json({ message: 'Published!' });
    },
  },
],
```

---

## Next.js Integration (App Router)

```ts
// app/(payload)/admin/[[...segments]]/page.tsx  — auto-generated by Payload

// src/app/api/[...slug]/route.ts
import { nextHandler } from 'payload/next';
import configPromise from '@payload-config';

export const { GET, POST, DELETE, PATCH, PUT, OPTIONS } = nextHandler(configPromise);

// Using Payload in Server Components
import { getPayload } from 'payload';
import config from '@payload-config';

export default async function Page() {
  const payload = await getPayload({ config });
  const posts = await payload.find({ collection: 'posts' });
  return <div>{posts.docs.map(p => <p key={p.id}>{p.title}</p>)}</div>;
}
```