import { CollectionConfig, slugField } from "payload";

export const Crazy: CollectionConfig = {
    slug: 'crazy',
    versions: {
        drafts: {
            autosave: true,
            schedulePublish: true,
            validate: false,
        }
    },
    fields: [
        {
            name: 'title',
            type: 'text',
            required: true,
        },
        {
            type: 'collapsible',
            label: 'Code',
            fields: [
                {
                    name: 'titleCode',
                    type: 'text',
                },
                {
                    name: 'contentCode',
                    type: 'code',
                    admin: {
                        language: 'html',
                    },
                },
                {
                    name: 'more_info',
                    type: 'json',
                }
            ]
        },
        slugField({ fieldToUse: 'title' }),
    ],
}