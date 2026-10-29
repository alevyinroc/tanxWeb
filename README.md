# TAN[X] FRC Team 3003 Website

Source for the Canandaigua FIRST Robotics, Team 3003 TAN[X] website. It's built
with [Jekyll](https://jekyllrb.com/) from Markdown files and published to
GitHub Pages by a GitHub Actions workflow.

- **How to edit content** (pages, sponsors, robot seasons, images): see
  [MAINTAINING.md](MAINTAINING.md)
- **Live site:** https://tanxrobotics.com/ (still on Weebly until DNS is switched;
  see [Going live](#going-live-switching-dns))

---

## Project status

This site is a clone of the original Weebly site at tanxrobotics.com, rebuilt
with Jekyll. It is not live yet.

### What's here

- **All pages, in Markdown:** Home, Sponsorship, Team Information, Our Robots,
  Robotics Resources and Contact Us, plus the Championship Information page,
  which isn't in the menu but is linked from Team Information. Each keeps its
  old Weebly URL (e.g. `/sponsorship.html`), so existing links keep working
  after the DNS switch.
- **Theme:** the original colors, fonts, banners, section backgrounds and the
  tabbed Team Information box are all reproduced. On phones the menu collapses
  into a hamburger.
- **Assets:** all images and PDFs from the old site, sorted into
  `assets/images/` by page and season.
- **Sponsorship:** sponsors are stored per season in
  `_data/sponsors/<year>.yml` (currently only `2026.yml`). The Sponsorship page
  always shows the newest year, and each season page lists its own year's
  sponsors at the bottom. Logo size, name size and logos per row are set once
  per level in `_data/sponsor_levels.yml`, so each level is smaller than the
  one above it.
- **Our Robots:** there's one file per season in `_robots/` for 2009–2026,
  served at the old URLs (`/2023-season.html`). The nine seasons the old site
  had (2015–2020 and 2022–2024) are fully filled in. The other nine are
  placeholders, and the Our Robots grid builds itself from these files. Season
  photos appear automatically when you drop them into
  `assets/images/robots/<year>/gallery/`.
- **Deployment:** `.github/workflows/pages.yml` builds pull requests to catch
  errors and deploys on every push to `main`.
- **Local tools:** `setup`, `serve` and `build` scripts in both `.bat` and
  `.sh` form. Gems install into the repo folder, so no admin rights are needed.
  There's also a GitHub Codespaces config so students on locked-down PCs can
  edit and preview in a browser with nothing installed.
- **Docs:** this README covers installation, the branch and pull request
  workflow, and DNS go-live steps. [MAINTAINING.md](MAINTAINING.md) has
  how-tos for the common edits.

### Where it differs from the old site

- The footer search box is gone, because it relied on Weebly's hosted search.
- The season photo slideshows are now photo grids.
- The 2020 "Robot Drive Base CAD" button is dropped, because it didn't link
  anywhere.
- The game names on the placeholder seasons were filled in from FRC history,
  not from the old site.

### Still to do

1. **Turn on Pages:** in Settings > Pages, set the source to
   **GitHub Actions**. Nothing will deploy until this is set.
2. **Check the Windows install steps:** [Windows setup](#windows-setup-works-on-restricted-student-accounts)
   tells students to pick "Install for me only" in RubyInstaller. That hasn't
   been tested on a Windows PC yet. Codespaces is the fallback if it doesn't
   work.
3. **Review the "Content to verify" list in [MAINTAINING.md](MAINTAINING.md#content-to-verify):**
   the old text was copied as-is, including what look like errors, and they're
   listed there. Examples: a 2015 event dated 2022, "Rank 19 of 18" in 2018,
   and the 2018 robot specs that look copied from 2022. The "CA" and "STS"
   sponsor names were guessed from their logos, so please confirm those too.

---

## Quick start

| | Windows | Mac / Linux |
|---|---|---|
| One-time setup | double-click `setup.bat` | `./setup.sh` |
| Preview while editing | double-click `serve.bat` | `./serve.sh` |
| Build only (check for errors) | double-click `build.bat` | `./build.sh` |

The preview runs at **http://localhost:4000/** and refreshes when you save a
file. Press **Ctrl+C** in the window to stop it. If you edit `_config.yml`,
stop and restart the preview.

You need **Ruby 3.0 or newer** first; see below. Gems are installed into this
folder (`vendor/bundle`), so nothing needs admin rights.

### Windows setup (works on restricted student accounts)

1. Download the **Ruby+Devkit 3.3.x (x64)** installer from
   https://rubyinstaller.org/downloads/.
2. Run it. When asked, choose **"Install for me only"**. If the suggested
   folder is something like `C:\Ruby33-x64` and that's blocked, change it to a
   folder in your profile, e.g. `C:\Users\<you>\Ruby33-x64`.
3. Leave **"Add Ruby executables to your PATH"** and **"Run 'ridk install'"**
   checked. At the end, a black window asks which components to install:
   press **Enter** (the default, which includes MSYS2 and the development
   toolchain) and wait for it to finish.
4. Open this folder and double-click `setup.bat`, then `serve.bat`.

If the installer insists on admin rights on your PC, use
[Codespaces](#no-install-option-github-codespaces) instead.

### Mac setup

macOS includes Ruby 2.6, which is too old. Install a newer one with
[Homebrew](https://brew.sh/):

```sh
brew install ruby
echo 'export PATH="$(brew --prefix)/opt/ruby/bin:$PATH"' >> ~/.zshrc
# open a new terminal window, then:
ruby -v        # should say 3.x
./setup.sh
./serve.sh
```

(Mentors who already use `rbenv`, `chruby`, or `asdf` can use those instead.)

### No-install option: GitHub Codespaces

Everything runs in the browser, which is handy on locked-down school PCs.

1. On the GitHub repository page, click **Code > Codespaces > Create codespace**.
2. Wait for setup to finish (it runs `./setup.sh` automatically).
3. In the terminal at the bottom, run `./serve.sh`.
4. Open the **Ports** tab and click the globe icon next to port 4000.

---

## Working together (branches and pull requests)

Several people may be editing at once, so please don't commit directly to `main`.

1. Create a branch for your change, e.g. `update-2026-sponsors`.
2. Make and preview your changes, then commit and push the branch.
3. Open a **pull request** into `main`. GitHub Actions builds the site for every
   pull request, and a red ✗ means the build failed; click it to see the error.
4. After someone reviews it, merge. Merging into `main` publishes the site
   automatically, usually within a couple of minutes.

Tips for avoiding merge conflicts:

- Keep each pull request focused on one thing (one season page, one sponsor update).
- Each season has its own file (`_robots/2025.md`) and image folder, so different
  people can work on different seasons without conflicts.
- Pull/merge the latest `main` into your branch before opening a pull request.

---

## Deployment

`.github/workflows/pages.yml` builds the site with Jekyll and deploys it to
GitHub Pages on every push to `main`. You can also run it manually from the
**Actions** tab ("Run workflow").

**One-time repository setup:** in **Settings > Pages**, set
**Build and deployment > Source** to **GitHub Actions**.

Until a custom domain is set, the site is served at
`https://<owner>.github.io/<repo>/`. The workflow passes that `/<repo>` base
path to Jekyll automatically, which is why links in templates use
`| relative_url` (see MAINTAINING.md).

### Going live (switching DNS)

When the team is ready to move `tanxrobotics.com` off Weebly:

1. In **Settings > Pages > Custom domain**, enter `tanxrobotics.com` and save.
   With Actions-based deployment, this setting is what matters; a `CNAME`
   file in the repo is not needed.
2. At the DNS provider for `tanxrobotics.com`:
   - Apex `tanxrobotics.com`: `A` records to `185.199.108.153`,
     `185.199.109.153`, `185.199.110.153`, `185.199.111.153` (and optionally
     `AAAA` records `2606:50c0:8000::153`, `2606:50c0:8001::153`,
     `2606:50c0:8002::153`, `2606:50c0:8003::153`).
   - `www`: `CNAME` to `<owner>.github.io`.
   - Remove the old Weebly records.
   Check GitHub's current guidance first:
   https://docs.github.com/pages/configuring-a-custom-domain-for-your-github-pages-site
3. Once the certificate is issued, tick **Enforce HTTPS**.
4. Re-run the workflow (Actions tab) so the site is rebuilt with an empty base path.

Page URLs match the old Weebly site (`/sponsorship.html`, `/2023-season.html`,
etc.), so existing links and search results keep working.

---

## Repository layout

```
_config.yml              Site settings (title, team email, current sponsor year)
_data/                   Lists that drive parts of the site
  navigation.yml           Top menu
  social.yml               Footer social links
  sponsor_levels.yml       Platinum/Gold/... names, colors, logo sizes
  sponsors/<year>.yml      Sponsors for each season
_robots/<year>.md        One file per season page (2009-2026)
_layouts/                Page templates (default, page, robot)
_includes/               Reusable pieces (header, footer, banner, sponsors, gallery)
assets/css/main.scss     All styling
assets/js/site.js        Tabs on the Team Information page
assets/images/           Images, organized by page/season
assets/docs/             PDFs (sponsorship packets)
*.md (root)              The main pages (index, sponsorship, team-information, ...)
setup/serve/build .bat/.sh  Local helper scripts
.github/workflows/       GitHub Pages build and deploy
.devcontainer/           GitHub Codespaces configuration
```
