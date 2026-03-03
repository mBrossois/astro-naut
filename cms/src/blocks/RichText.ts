import { FixedToolbarFeature, HeadingFeature, lexicalEditor } from '@payloadcms/richtext-lexical'
import type { Block } from 'payload'

export const RichText: Block = {
  slug: 'RichText',
  imageURL: 'https://s2.qwant.com/thumbr/474x316/6/1/288e59cbae8612ace48065d742ff4ed5cbc61e64eddf3bc04478a2641c06bf/OIP.C1P9YSN3qATLGrnLj5BEXwHaE8.jpg?u=https%3A%2F%2Ftse.mm.bing.net%2Fth%2Fid%2FOIP.C1P9YSN3qATLGrnLj5BEXwHaE8%3Fpid%3DApi&q=0&b=1&p=0&a=0',
  imageAltText: 'A nice thumbnail image to show what this block looks like',
  interfaceName: 'RichText',
  fields: [
    {
        name: 'richText',
        type: 'richText',
        editor: lexicalEditor({
          features: ({ rootFeatures }) => {
            return [
              ...rootFeatures,
              HeadingFeature({ enabledHeadingSizes: ['h1', 'h2', 'h3', 'h4'] }),
              FixedToolbarFeature(),
            ]
          },
        }),
        label: false,
      },
  ],
}