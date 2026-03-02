import sanitizeHtml from 'sanitize-html';

export function sanitizeHTML(html) {
  return sanitizeHtml(html, {
    allowedTags: sanitizeHtml.defaults.allowedTags.concat(['img']),
    allowedAttributes: {
      'a': ['href', 'name', 'target'],
      'img': ['src', 'alt'],
    },
  });
}