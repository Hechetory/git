# Homepage maintenance guide

Most updates should only touch `_data/`, the three Markdown collections, and
`assets/pdfs/`. You normally do not need to edit HTML or CSS.

## Add a note

1. Put the PDF in `assets/pdfs/`, using a short filename without spaces, for
   example `etale-cohomology-notes.pdf`.
2. Copy `_notes/example-note.md` to a descriptive filename such as
   `_notes/etale-cohomology.md`.
3. Edit the front matter:

```yaml
---
title: "Notes on étale cohomology"
date: 2026-09-01
description: "Notes for an undergraduate reading seminar."
pdf: "/assets/pdfs/etale-cohomology-notes.pdf"
---
```

Do not include `published: false` in the new file. Jekyll automatically sorts
notes newest first and adds the entry to the Notes section.

## Update education

Edit `_data/education.yml`. Each item has the same structure:

```yaml
- institution: Fudan University
  degree: Bachelor of Science
  field: Mathematics
  period: 2024–2028
  description: "Optional details, honors, or thesis information."
```

Add another block beginning with `- institution:` for another school or degree.

## Update research interests

Edit `_data/research.yml`. Change `introduction` for the overview and add or
remove entries below `interests`.

## Add a publication

Copy `_publications/example-publication.md` to a new Markdown file, update its
fields, and remove `published: false`. A local PDF belongs in `assets/pdfs/`;
an arXiv page can be entered as a full external URL.

## Add a talk

Copy `_talks/example-talk.md` to a new Markdown file, update its fields, and
remove `published: false`. Slides can also be stored in `assets/pdfs/`.

## Add or replace the CV

1. Put the file in `assets/pdfs/`, for example `xiaobo-feng-cv.pdf`.
2. Edit `_data/cv.yml`:

```yaml
pdf: "/assets/pdfs/xiaobo-feng-cv.pdf"
updated: "September 2026"
```

## Local preview

Install Ruby with RubyInstaller on Windows, including the MSYS2 development
tools. Then open PowerShell in this project folder and run:

```powershell
gem install bundler
bundle install
bundle exec jekyll serve
```

Open `http://127.0.0.1:4000/`. Keep the last command running while editing;
Jekyll rebuilds the site after saved changes. The first two commands are only
needed for initial setup or dependency updates.

## Commit and push

From this project folder:

```powershell
git status
git add .
git commit -m "Update academic homepage"
git push
```

Running `git add .` from this folder stages homepage files only. To include the
deployment workflow as well, run the same command once from the parent Git
repository root.

On GitHub, open Settings → Pages and choose **GitHub Actions** as the source.
The workflow in `.github/workflows/pages.yml` builds this `git_home_page`
subdirectory after you push to `main`. It calculates the correct Pages URL
automatically, even if you later rename the repository.

## Files normally left alone

- `index.html`: Liquid page template and section layout.
- `_layouts/default.html`: shared HTML document shell.
- `_includes/header.html` and `_includes/footer.html`: navigation and footer.
- `assets/css/styles.css`: the visual design and responsive rules.
- `Gemfile`: the GitHub Pages/Jekyll dependency.

Edit these only when changing site structure, navigation, or visual design.
Jekyll creates `_site/` during local builds; never edit or commit that generated
folder.
