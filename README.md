# StaffEng Podcast

A minimal, performant blog built with Hugo and the Dario theme, integrated with Contentful CMS, and deployed to GitHub Pages.

## Quick Start

1. **Install Hugo** (if not already installed):
   ```bash
   # macOS
   brew install hugo

   # Or download from https://gohugo.io/installation/
   ```

2. **Run development server**:
   ```bash
   hugo server -D
   ```
   Visit http://localhost:1313

3. **Fetch content from Contentful** (optional):

   Create a `.env` file:
   ```bash
   cp .env.example .env
   # Edit .env with your Contentful credentials
   ```

   Then run:
   ```bash
   ./scripts/fetch-contentful.sh
   ```

4. **Build for production**:
   ```bash
   hugo --minify
   ```

## Theme

This site uses the **Dario Hugo Theme** - a minimal theme inspired by Dario Amodei's personal website.

- Theme repository: https://github.com/GrantBirki/dario
- Perfect Google PageSpeed score (100/100)
- Uses vanilla CSS only (no frameworks)
- Dark/light mode toggle with system preference detection
- Minimal, elegant, and focused on reading

## Features

- **Minimal Design**: Clean, distraction-free reading experience
- **High Performance**: Perfect PageSpeed scores
- **Dark/Light Mode**: Toggle or follow system preference
- **Contentful CMS**: Optional headless CMS integration
- **GitHub Pages**: Static hosting with automatic deployment

## Deploy to GitHub Pages

1. Push this repository to GitHub
2. Go to Settings → Pages → Set source to "GitHub Actions"
3. Add secrets in Settings → Secrets and variables → Actions (optional):
   - `CONTENTFUL_SPACE_ID`
   - `CONTENTFUL_ACCESS_TOKEN`
4. Push to main branch to trigger deployment

## Project Structure

- `themes/dario/` - Dario Hugo theme (git submodule)
- `config/_default/hugo.toml` - Hugo configuration
- `content/` - Markdown content (posts, pages)
  - `_index.md` - Homepage content and metadata
  - `posts/` - Blog posts
- `scripts/` - Contentful fetch script
- `.github/workflows/` - GitHub Pages deployment

See [CLAUDE.md](CLAUDE.md) for detailed development guidance.

## Tech Stack

- **Hugo**: Static site generator
- **Dario Theme**: Minimal, performant theme with vanilla CSS
- **Contentful**: Headless CMS (optional)
- **GitHub Pages**: Hosting
- **GitHub Actions**: CI/CD pipeline
