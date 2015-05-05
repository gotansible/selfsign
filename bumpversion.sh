#!/bin/bash
# arguments are: major, minor patch
#https://github.com/peritus/bumpversion


if [ -z "$(git status --porcelain)" ]; then 
  # Working directory clean
  #git checkout master
  #git merge develop
  #git checkout develop
  bumpversion $1
  #git add .
  #git commit -m 'bumpversion'
  #git push --all
  #git push --tags
else 
  # Uncommitted changes
  echo 'uncommitted changes exist, must be run on a clean repository'
fi
