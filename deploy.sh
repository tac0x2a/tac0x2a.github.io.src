#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mUpdate public directory...\033[0m\n"
cd public
git checkout -f master
git pull origin master
cd ../

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"
# Build the project.
# mv public/.git public.git
# rm -rf public
hugo -t even # if using a theme, replace with `hugo -t <YOURTHEME>`
# # hugo --cleanDestinationDir
# mv public.git public/.git

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

cd ../
git add public
git commit -m "Update public submodule public - $msg"

printf "\033[0;32mCompleted\033[0m\n"
