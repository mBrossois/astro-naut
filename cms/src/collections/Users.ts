import type { CollectionConfig } from 'payload'

const readRoles = ['admin', 'editor']

export const Users: CollectionConfig = {
  slug: 'users',
  admin: {
    useAsTitle: 'email',
  },
  versions: {
    drafts: false,
  },
  access: {
    read: ({req: {user}}) => {
      return !!(user && user.roles && readRoles.includes(user.roles))
    },
    create: ({req: {user}}) => {
      return !!(user && user.roles && user.roles === 'admin')
    },
    update: ({ req: {user}} ) => {
      return !!(user && user.roles && user.roles === 'admin')
    },
    delete: ({ req: {user}} ) => {
      return !!(user && user.roles && user.roles === 'admin')
    },  },
  auth: true,
  fields: [
    // Email added by default
    // Add more fields as needed
    {
      name: 'roles',
      type: 'select',
      hasMany: false,
      options: ['admin', 'editor', 'readOnly'],
      defaultValue: ['readOnly'],
      required: true,
    },
  ],
}
