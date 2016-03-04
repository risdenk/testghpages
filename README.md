# testghpages

This repo is designed to test Travis CI keeping documentation up to date:
* Github Pages
* Wiki

## How it works

### Travis CI
Travis CI takes any PR or commit and runs a test followed by deploy as configured in .travis.yml. This runs tests with `./run_tests.sh` and if on the master branch and a successful build, runs `./deploy.sh`. These scripts ensure that proper tests are run and then documentation is deployed.

### run_tests.sh
#### test_docs.sh
This uses the github-pages gem to grab the proper dependencies. Then uses Jekyll to build the site like Github would. This prevents pushing a broken site.

### deploy.sh
#### deploy_pages.sh
This takes the contents of the docs folder upon a successful build/test and pushes them to the gh-pages branch of the repo. Github will then build a page from there.

#### update_wiki.sh
This takes the contents of the docs/wiki folder upon a successful build/test and pushes them to the wiki repo. This is then displayed by Github properly.

## Viewing gh-pages locally
1. `cd docs`
2. `gem install bundle`
3. `bundle exec jekyll serve`
4. Open `http://localhost:4000`

## Links
* https://github.com/risdenk/testghpages
* https://travis-ci.org/risdenk/testghpages
* http://risdenk.github.io/testghpages/
* https://github.com/risdenk/testghpages/wiki
