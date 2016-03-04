#!/usr/bin/env bash

set -e
set -u

# clear and re-create the out directory
rm -rf gh-pages || exit 0;

git clone -b gh-pages --single-branch "https://${GH_TOKEN}@${GH_REF}" gh-pages

rm -rf gh-pages/*
shopt -s dotglob
cp -r docs/* gh-pages/

cd gh-pages
git config user.email "travisci@travisci.org"
git config user.name "Travis CI"
git add -A .
git commit -m "Updated gh-pages based on $TRAVIS_BRANCH commit $TRAVIS_COMMIT" || exit 0
git push --quiet origin gh-pages > /dev/null 2>&1
