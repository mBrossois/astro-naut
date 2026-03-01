import { type CollectionConfig } from 'payload'

export const Entries: CollectionConfig = {
  slug: 'entries',
  access: {
    read: () => true,
  },
  admin: {
    useAsTitle: 'title',
  },
  fields: [
    { 
      name: 'slug', 
      type: 'text', 
      admin: { readOnly: true }, 
      access: {
        read: ({ req: { user } }) => {
            return !!(user && user.roles && user.roles.includes('admin'))
        },
      },
      defaultValue: 'entries' 
    },
    {
      name: 'title',
      type: 'text',
      required: true,
    },
    {
    name: 'description',
    type: 'text',
    },
    {
    name: 'thumbnail',
    type: 'upload',
    relationTo: 'media',
    },
    {
        name: 'tags',
        type: 'array',
        required: true,
        fields: [
            { name: 'tag', type: 'select', required: true, options: ['Web Dev FE', 'Web Dev BE', '3D Printing', 'Other'] }
        ]
    },
    {
        name: 'learnings',
        type: 'richText',
    },
    {
        name: 'nextSteps',
        type: 'richText',
    }
  ],
  trash: true,
}
