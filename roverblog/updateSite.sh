#!/bin/bash
hugo -t hugo-vitae
cd public/
git add .
git commit -m 'updating static files'
git push origin main
