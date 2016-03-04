#!/usr/bin/env bash

set -e

cd docs
bundle install
bundle exec jekyll build --safe
bundle exec jekyll clean 
