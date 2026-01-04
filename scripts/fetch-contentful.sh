#!/bin/bash

# Fetch content from Contentful and generate Hugo markdown files
# Usage: ./scripts/fetch-contentful.sh

set -e

# Load .env file if it exists
if [ -f .env ]; then
    echo "Loading environment variables from .env file..."
    export $(grep -v '^#' .env | xargs)
fi

SPACE_ID="${CONTENTFUL_SPACE_ID}"
ACCESS_TOKEN="${CONTENTFUL_ACCESS_TOKEN}"

if [ -z "$SPACE_ID" ] || [ -z "$ACCESS_TOKEN" ]; then
    echo "Error: CONTENTFUL_SPACE_ID and CONTENTFUL_ACCESS_TOKEN environment variables must be set"
    exit 1
fi

# Fetch entries from Contentful
CONTENT_TYPE="${CONTENTFUL_CONTENT_TYPE:-blog-post}"
API_URL="https://cdn.contentful.com/spaces/${SPACE_ID}/environments/master/entries?access_token=${ACCESS_TOKEN}&content_type=${CONTENT_TYPE}"

echo "Fetching content from Contentful..."

RESPONSE=$(curl -s "$API_URL")

# Parse JSON and create markdown files
# This is a simple implementation - you may want to use jq for more complex parsing
echo "$RESPONSE" | python3 -c "
import sys
import json
import os
from datetime import datetime

data = json.load(sys.stdin)
items = data.get('items', [])
includes = data.get('includes', {})
assets = {asset['sys']['id']: asset for asset in includes.get('Asset', [])}

content_dir = 'content/season-2'
os.makedirs(content_dir, exist_ok=True)

for item in items:
    fields = item.get('fields', {})
    sys_info = item.get('sys', {})

    title = fields.get('title', 'Untitled')
    slug = fields.get('slug', sys_info.get('id'))
    body = fields.get('body', '')
    created_at = sys_info.get('createdAt', '')

    # Create markdown file
    filename = f'{content_dir}/{slug}.md'

    with open(filename, 'w') as f:
        f.write('---\n')
        f.write(f'title: \"{title}\"\n')
        f.write(f'date: {created_at}\n')
        f.write(f'contentful_id: \"{sys_info.get(\"id\")}\"\n')
        f.write('---\n\n')
        f.write(body)

    print(f'Created: {filename}')

print(f'\\nFetched {len(items)} posts from Contentful')
"

echo "Done!"
