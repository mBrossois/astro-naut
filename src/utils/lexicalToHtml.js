import { convertLexicalToHTML } from '@payloadcms/richtext-lexical/html';

export function lexicalToHTML(data) {
  return convertLexicalToHTML({ data });
}
