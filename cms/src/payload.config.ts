import { sqliteAdapter } from '@payloadcms/db-sqlite'
import { lexicalEditor } from '@payloadcms/richtext-lexical'
import path from 'path'
import { buildConfig } from 'payload'
import { fileURLToPath } from 'url'
import sharp from 'sharp'

import { Users } from '@collections/Users'
import { Media } from '@collections/Media'
import { Entries } from '@collections/Entries'
import { Pages } from '@collections/Pages'
import { What } from '@globals/What'
import { Crazy } from '@collections/Crazy'

import { Nav } from '@globals/Nav'

const filename = fileURLToPath(import.meta.url)
const dirname = path.dirname(filename)

export default buildConfig({
  admin: {
    user: Users.slug,
    importMap: {
      baseDir: path.resolve(dirname),
    },
    components: {
      providers: ['./components/ClickableRows.tsx'],
    },
    autoLogin: process.env.NODE_ENV === 'development'
        ? {
            email: process.env.PAYLOAD_EMAIL,
            password: process.env.PAYLOAD_PASSWORD,
            prefillOnly: true,
          }
        : false,
  },
  collections: [
    Users, 
    Media,
    Entries,
    Pages,
    Crazy,
  ],
  globals: [
    Nav,
    What,
  ],
  editor: lexicalEditor(),
  secret: process.env.PAYLOAD_SECRET || '',
  typescript: {
    outputFile: path.resolve(dirname, 'payload-types.ts'),
  },
  db: sqliteAdapter({
    client: {
      url: process.env.DATABASE_URL || '',
    },
  }),
  sharp,
  plugins: [],
  cors: {
    origins: ['http://localhost:3000', 'http://localhost:4321'],
    headers: ['x-api-key'],
  },
})
