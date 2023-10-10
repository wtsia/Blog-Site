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

git submodule add --name <name> <repository url> <folder>

``
## Design
The site per hugo-vitae holds multiple pages of which a tags and category page will organize each document's respective classification.

Note that images will be stored in the directory `/static/img/<topic>/<imageName.png>`

To reference them in notes, direct them to:
`/rover/img/<topic>/<imageName>.jpg`

### Backups
Using the package `rclone`, type in a terminal
```
sudo apt-get install rclone
```
Once installed, initiate configuration settings and choose as desired:
```
> rclone config
```
Rclone setup is self-explanatory. To create a directory that can be synced directly into your drive via mounting:
```
rclone mount --daemon <remote-drive-name>: <directory-of-target-folder>
```
Script to automatically upload files to drive from a Linux system:
```
#!/bin/bash

/usr/bin/rclone copy --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "/home/<user>/<directory>" "<remote-name>:<folder-name-in-drive>"
```
### Note on KaTeX Matrices:
Synopsis: KaTeX on Hugo is slightly bugged. To render matrices correctly, new line markers `\\` must be escaped. This looks like `\\\\`. Additionally, the $KaTeX$ input must be on one line.

[Source](https://github.com/KaTeX/KaTeX/issues/1831#issuecomment-453703898)

"Major breakthrough \o/

Escaping the \\ solves the problem:
```
$$ \left[\begin{array} {rrr} 3.381563 & 3.389113 \\\\ 4.527875 & 5.854178 \\\\ 2.655682 & 4.411995 \\\\ \vdots & \vdots \end{array}\right] $$
```
I suspect now we've gone full circle to what @edemaine was suggesting to have a look at: https://gohugo.io/content-management/formats/#issues-with-markdown

I suspect if I modify the code which uses katex and add the displayMath math "hack" mentioned in hugo documentation I should be fine."

## Technologies
##### Hugo static site generator

[Installation](https://gohugo.io/getting-started/installing/) for hugo:

Windows:
`choco install hugo -confirm`

##### Hugo-vitae
https://github.com/dataCobra/hugo-vitae

##### KaTeX
Supported Functions: https://katex.org/docs/supported.html

##### Rclone
https://rclone.org/