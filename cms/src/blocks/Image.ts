import type { Block } from 'payload'

export const Image: Block = {
  slug: 'Image',
  imageURL: 'https://s1.qwant.com/thumbr/474x474/8/8/0c810794ad89fd0c59db378071c9d47b39bd5b04703d5cff6703f5bacc6fe5/OIP.jaU2C9EsQDOa4R80x-WMfgHaHa.jpg?u=https%3A%2F%2Ftse.mm.bing.net%2Fth%2Fid%2FOIP.jaU2C9EsQDOa4R80x-WMfgHaHa%3Fpid%3DApi&q=0&b=1&p=0&a=0',
  imageAltText: 'A nice thumbnail image to show what this block looks like',
  interfaceName: 'Image',
  fields: [
    {
        name: 'image',
        type: 'upload',
        relationTo: 'media',
        required: true,
    }
  ],
}