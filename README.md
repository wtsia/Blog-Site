# Blog-Site
Blog site to serve articles where I explain topics to others (or myself)

Repo for Production (static assets):
https://github.com/wtsia/rover

Repo for Blog (this):
https://github.com/wtsia/Blog-Site

## Basics
##### Generating Static Files
in the roverblog directory, in a terminal run:

`hugo -t hugo-vitae`

cd into the public directory, and push changes to the github repo that holds the static assets, in this submodule run:

```
git status
git add .
git commit 'example message'
git push origin main
```
##### Local environment vs pushing to production
In local set `baseurl` to `www.example.com`

In production set `baseurl` to active site at `https://wtsia.github.io/rover/`

##### Previewing the site 
In a terminal within the directory of roverblog, run:

`hugo server`

##### Adding New Posts
`hugo new posts/[postname].md`

Notes: This new post draws from the content of default.md as a template.

## Themes
Obtain hugo themes on the hugo site [here](https://themes.gohugo.io/)

Vitae [here](https://themes.gohugo.io/themes/hugo-vitae/)

## Initializing a Git Submodule
This is not required for this repo, but useful to know for new blog sites:

``
git submodule add -b main <repository url> <folder>
``

## Technologies
##### Hugo static site generator

[Installation](https://gohugo.io/getting-started/installing/) for hugo:

Windows:
`choco install hugo -confirm`

##### Hugo-vitae
https://github.com/dataCobra/hugo-vitae

##### KaTeX
Supported Functions: https://katex.org/docs/supported.html