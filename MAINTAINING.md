# Maintaining the site

How the site is put together and how to make common changes. For installing
and previewing, see [README.md](README.md).

## The basics

- Pages are **Markdown** (`.md`) files. The block between the `---` lines at
  the top is **front matter** (YAML settings: title, banner image, and so on).
  Everything below it is the page content.
- `{{ ... }}` and `{% ... %}` are **Liquid** template tags; Jekyll fills them in
  when it builds the site.
- **Always preview** (`serve.bat` / `./serve.sh`) before committing. If the
  build fails, the error message names the file and line.

### Links and images: use `relative_url`

Before the custom domain is switched over, the site lives at
`https://<owner>.github.io/<repo>/`, so a link written as `/sponsorship.html`
would break. Wrap site paths with `relative_url`:

```markdown
![Our robot]({{ '/assets/images/robots/2024/robot.png' | relative_url }})
[Sponsorship]({{ '/sponsorship.html' | relative_url }})
```

Paths in **front matter** and **`_data` files** (`image:`, `logo:`,
`menu_image:` ...) are fine as plain `/assets/...`, because the templates add
`relative_url` for you. Links to other websites don't need it.

### Markdown inside HTML blocks

Some pages use `<section>`, `<div class="cols">` and similar to get the
original layout. You can write normal Markdown inside them, but **don't indent
it**: four leading spaces turns text into a code block.

Handy classes (add `{: .class-name}` on the line after a paragraph, heading,
list or image):

| Class | Effect |
|---|---|
| `.lead` | Larger paragraph text |
| `.title-xl`, `.title-lg` | Big bold headings |
| `.text-center` | Center text |
| `.img-center` | Center an image |
| `.button`, `.button .button--highlight` | Button-style link (outline / solid white) |
| `<div class="cols">` | Side-by-side columns (each child `<div>` is a column; stacks on phones) |

## Common tasks

### Edit text on a page

| Page | File |
|---|---|
| Home | `index.md` |
| Sponsorship | `sponsorship.md` (sponsor list itself is in `_data/sponsors/`) |
| Team Information | `team-information.md` |
| Our Robots | `our-robots.md` (the grid is automatic) |
| Robotics Resources | `robotics-resources.md` |
| Contact Us | `contact-us.md` |
| Championship Information (2023) | `championship-information.md` |
| Each season | `_robots/<year>.md` |
| Footer / header | `_includes/footer.html`, `_includes/header.html` |
| Menu | `_data/navigation.yml` |

### Update the sponsors

Sponsors are kept per season in `_data/sponsors/<year>.yml`. Each file is
used in two places, with nothing else to configure:

- **Sponsorship page:** always shows the **newest** year's file.
- **Season pages:** `/<year>-season.html` lists that year's sponsors at the
  bottom. A season with no sponsor file just doesn't show the section.

1. To start a new season, copy the latest file, e.g. `2026.yml` → `2027.yml`,
   and edit it. Each level (`platinum`, `gold`, `silver`, `bronze`, `nickel`)
   is a list:
   ```yaml
   gold:
     - name: Acme Corp                                   # required
       logo: /assets/images/sponsors/acme.png            # optional
       url: https://acme.example.com                     # optional link
       note: In Memory of ...                            # optional
   ```
   Sponsors without a `logo` are listed by name.
2. Put logo files in `assets/images/sponsors/`. Use lowercase names with dashes
   (`acme-corp.png`). Transparent PNGs look best on the dark background; a
   white or light version of the logo is ideal.
3. Restart the preview (`_data` files added while it's running may not be
   picked up). The Sponsorship page switches to 2027 automatically, and 2026's
   sponsors stay on the 2026 season page.
4. To add a past season's sponsors, create that year's file the same way. It
   only appears on that season's page, since it isn't the newest year.

File names must be just the year (`2027.yml`); that's how the site matches
sponsors to seasons and finds the newest one.

**Logo size follows the sponsorship level** automatically: the maximum logo
height and width for each level, the font size for name-only sponsors, and
logos per row are set in `_data/sponsor_levels.yml`. Change sizes there, never
on individual sponsors, so the levels stay consistent. To add or rename a level, edit that
file too (the `id` must match the key used in the year files).

### Add or fill in a season / robot page

Every season from 2009 to 2026 has a file in `_robots/`. Seasons without
content have `placeholder: true`, which shows a "coming soon" note.

1. Open `_robots/<year>.md` (or copy `_robots/_TEMPLATE.md` for a new year;
   files starting with `_` aren't published). The template lists every field.
2. Put that season's images in `assets/images/robots/<year>/`. The existing
   seasons use these names:
   - `menu.png`: picture on the Our Robots page (the year is usually drawn into it)
   - `banner.jpg`: background photo at the top of the season page
   - `game-logo.png`: game logo shown on the banner
   - `events.png`, `field.png`, `robot.png`: images in each section
3. **Season Highlights photos:** drop them into
   `assets/images/robots/<year>/gallery/`; they appear automatically, sorted
   by file name. Please resize big phone photos first (about 1600px wide is
   plenty) to keep the repository small.
4. Remove `placeholder: true` when the page has real content.
5. The text below the front matter appears under **The Game**.

The Our Robots grid is generated from these files, newest first. A season
with no `menu_image` shows a placeholder tile with the year.

The page URL is `/<year>-season.html` (same as the old Weebly site).

### Change the menu

Edit `_data/navigation.yml`. The `url` must match the page's `permalink`.

### Add a new page

Create `my-page.md` in the root:

```markdown
---
title: My Page
permalink: /my-page.html
banner:                        # optional
  image: /assets/images/backgrounds/my-banner.jpg
  height: 400
---
## Heading

Content...
```

Banner options are documented at the top of `_includes/banner.html`. Add it
to `_data/navigation.yml` if it should appear in the menu.

### Change colors or fonts

Everything is in `assets/css/main.scss`. The colors from the original Weebly
theme are variables at the top (`$bg`, `$accent`, ...). Fonts come from Google
Fonts (link in `_layouts/default.html`).

## How it fits together

- `_layouts/default.html`: the outer shell for every page (header, optional
  banner, footer).
- `_layouts/page.html`: wraps normal pages' content in a centered column.
  `index.md` uses `default` directly so it can have full-width sections.
- `_layouts/robot.html`: builds a season page from its front matter.
- `_robots/` is a Jekyll **collection** (configured in `_config.yml`), which
  is how the Our Robots page can loop over all seasons.
- `.github/workflows/pages.yml` builds with `bundle exec jekyll build` and
  deploys. Pull requests are built but not deployed.

## Differences from the original Weebly site

These are deliberate, or are things Weebly provided that a static site
can't:

- **Footer search box** removed (Weebly-hosted search). Could be added later
  with a client-side search.
- **Season Highlights** slideshows are now photo grids; click a photo to open
  it full size.
- **Emails** are plain `mailto:` links (Weebly/Cloudflare obfuscated them).
- **Our Robots** shows every season 2009–2026 in one grid, with placeholder
  tiles for seasons that don't have a picture yet.
- The **2020** page's "Robot Drive Base CAD for FRC2020" button was dropped
  because it didn't link anywhere on the old site.
- Season pages have previous/next season links at the bottom.

## Content to verify

Copied as-is from the old site. These look like mistakes, but someone on the
team should confirm before they're changed:

- `_robots/2015.md`: New York Tech Rally dates say "March 18-21, **2022**".
  The third event is listed as "Finger Lakes Regional, October 17, 2015"
  (probably Rah Cha Cha Ruckus?).
- `_robots/2018.md`: "Rank 19 of **18**" at Rochester Rally. The robot specs
  (Falcons, color sensor shooter, transversal hang) look copied from 2022.
- `_robots/2022.md`: the Game Reveal Video link is the same as 2015's.
- `_data/sponsors/2026.yml`: Bronze lists both a "Kodiak Cutting Tools" logo
  and the name "Kodiac Cutting Tools". Probably a duplicate.
- `_data/sponsors/2026.yml`: the "CA" and "STS" logo names
  (`Canandaigua Academy`, `STS`) were guessed from the images. Fix the
  `name:` (used as alt text) if they're wrong.
- `index.md`: "been to the **Word** Championships twice", while Team
  Information says "three times in the past 15 years".
- `team-information.md`: Team Fee mentions the "2022-23 season".
- Game names on placeholder seasons (2009–2014, 2021, 2025, 2026) were filled
  in from FRC history and are not from the old site.
