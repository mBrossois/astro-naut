import { GlobalConfig, slugField } from "payload"

export const What: GlobalConfig = {
    slug: 'what',
    versions: {
        drafts: false,
    },
    fields: [
        {
            type: 'row',
            fields: [
                {
                    name: 'title',
                    type: 'text',
                    required: true,
                },
                {
                    name: 'description',
                    type: 'text',
                    required: true,
                },
                {
                    name: 'image',
                    type: 'upload',
                    relationTo: 'media',
                    required: true,
                },
                {
                    name: 'imageAltText',
                    type: 'text',
                    required: true,
                },
            ],
        },
        {
            type: 'textarea',
            name: 'textContent',
        },
        slugField({ fieldToUse: 'title' }),
    ]
}