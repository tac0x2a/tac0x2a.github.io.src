#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mUpdate public directory...\033[0m\n"
mv public/.git public.git
rm -rf public
hugo --cleanDestinationDir
mv public.git public/.git

cd public
git checkout -f master
git pull origin master
cd ../

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

printf "\033[0;32mCompleted\033[0m\n"