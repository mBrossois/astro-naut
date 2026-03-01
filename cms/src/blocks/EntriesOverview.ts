import type { Block } from 'payload'

export const EntriesOverview: Block = {
  slug: 'EntriesOverview',
  imageURL: 'https://images.unsplash.com/photo-1534796636912-3b95b3ab5986?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  imageAltText: 'A nice thumbnail image to show what this block looks like',
  interfaceName: 'EntriesOverview',
  fields: [
    {
      type: 'array',
      name: 'entries',
      label: 'Entries',
      fields: [
        {
          name: 'entry',
          type: 'relationship',
          relationTo: 'entries',
        },
      ],
    },
  ],
}