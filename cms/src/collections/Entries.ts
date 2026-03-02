import { adminOrAccessToken } from '@/utils/auth'
import { type CollectionConfig, type FieldAccess } from 'payload'

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
      unique: true,
      required: true,
      access: {
        read: adminOrAccessToken,
      },
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
