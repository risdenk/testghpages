#!/usr/bin/env bash

set -e
set -u

# clear and re-create the out directory
rm -rf .wiki || exit 0;

git clone "https://${GH_TOKEN}@${GH_WIKI_REF}" .wiki

rm -rf .wiki/*
shopt -s dotglob
cp -r docs/wiki/* .wiki/

cd .wiki
git config user.email "travisci@travisci.org"
git config user.name "Travis CI"
git add -A .
git commit -m "Updated wiki based on $TRAVIS_BRANCH commit $TRAVIS_COMMIT" || exit 0
git push --quiet origin > /dev/null 2>&1
