# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a static blog built with Hugo using the Dario theme. The site is deployed to GitHub Pages and features a minimal, performant design focused on reading.

## Common Commands

### Initial Setup
```bash
# Clone the repository with submodules
git clone --recursive <repo-url>

# Or if already cloned, initialize submodules
git submodule update --init --recursive
```

### Development
```bash
hugo server -D

hugo --minify
```


### Theme Management
```bash
# Update theme to latest version
cd themes/dario
git checkout main
git pull
cd ../..
git commit themes/dario -m "Update Dario theme"
```

## Architecture

### Content Flow
3. **Hugo Build**: Hugo processes markdown files with Dario theme templates to generate static HTML
4. **GitHub Pages**: Static site is deployed via GitHub Actions

### Directory Structure
- `themes/dario/`: Dario Hugo theme (git submodule)
  - Uses vanilla CSS only (no frameworks)
  - Minimal, performant design
  - Reference: https://github.com/GrantBirki/dario
- `config/_default/hugo.toml`: Hugo configuration
  - Site metadata (baseURL, title, language)
  - Theme settings
  - Author information
  - Color scheme preferences
- `content/`: Markdown content files
  - `_index.md`: Homepage content with subtitle and description
  - `posts/`: Blog posts 
- `public/`: Generated static site (gitignored)

### Configuration

**config/_default/hugo.toml**:
- `baseURL`: Your site's base URL
- `title`: Site title
- `copyright`: Copyright notice (use `{year}` for auto-updating year)
- `theme = 'dario'`: Theme selection
- `params.description`: Site meta description
- `params.colorScheme`: Color mode - `'toggle'` (default), `'light'`, `'dark'`, or `'system'`
- `params.author`: Author information (name, email, twitter)
- `mainSections`: Optional - specify which sections to show on homepage

**content/_index.md**:
- `subtitle`: Homepage subtitle
- `description`: Homepage description for open graph tags
- Content below front matter appears on the homepage

### Deployment
- GitHub Actions workflow at `.github/workflows/deploy.yml`
- Triggers on push to main branch
- Steps: checkout (with submodules) → setup Hugo → build → deploy to GitHub Pages

## Dario Theme

The site uses the Dario Hugo theme, which provides:

### Features
- Minimal, clean design inspired by Dario Amodei's website
- Perfect Google PageSpeed score (100/100)
- Vanilla CSS only (no frameworks or build steps)
- Dark/light mode toggle or system preference following
- Responsive, mobile-first layout
- Fast loading times
- Open Graph and X Card meta tags
- Syntax highlighting for code blocks

### Color Modes
Set in `config/_default/hugo.toml` under `params.colorScheme`:
- `'toggle'` (default): Shows a toggle switch, defaults to system preference on first load
- `'light'`: Always light mode
- `'dark'`: Always dark mode
- `'system'`: Follows user's system preference

### Customization
- To customize CSS, create `assets/css/custom.css` and add your styles
- Override layouts by creating files in your project's `layouts/` directory
- The theme is minimal by design - major customizations may require forking

### Theme Updates
- The theme is included as a git submodule at `themes/dario/`
- Update to latest: `cd themes/dario && git pull && cd ../..`
- View available versions: https://github.com/GrantBirki/dario/releases


## GitHub Pages Setup

To enable GitHub Pages deployment:
1. Go to repository Settings → Pages
2. Set Source to "GitHub Actions"
4. Push to main branch to trigger deployment

Note: The GitHub Actions workflow runs `hugo --minify` to build the site.

## Development Tips

- The Dario theme uses vanilla CSS, so there's no CSS build process
- To preview draft posts, use `hugo server -D`
- The theme is designed for minimal customization - embrace simplicity
- Homepage shows recent posts from the main sections automatically
