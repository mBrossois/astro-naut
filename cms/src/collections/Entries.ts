import { adminOrAccessToken, adminOrPublished } from '@/utils/auth'
import { slugField, type CollectionConfig, type FieldAccess } from 'payload'

export const Entries: CollectionConfig = {
  slug: 'entries',
  access: {
    read: adminOrPublished,
  },
  admin: {
    useAsTitle: 'title',
  },
  versions: {
    drafts: true,
  },
  fields: [
    slugField({useAsSlug: 'title'}),
    {
      name: 'releasedAt',
      type: 'date',
      required: true,
      admin: {
        date: {
          pickerAppearance: 'dayOnly'
        },
        position: 'sidebar'
      }
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
        ],
        admin: {
          position: 'sidebar'
        }
    },
    {
        name: 'learnings',
        type: 'richText',
    },
    {
        name: 'nextSteps',
        type: 'richText',
    },
  ],
  lockDocuments: {
    duration: 600, // Duration in seconds
  },
  trash: true,
  indexes: [
    {
      fields: ['slug'], 
    }
  ]
}
