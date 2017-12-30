#!/bin/bash

#git clone https://github.com/in-house-swagger/in-house-swagger.git
cd ~/target
/home/travis/.travis/travis-build/bin/travis compile --no-interactive > ~/build.sh.tmp

rm -R ~/build
mkdir -p ~/build
cp -r ~/target/* ~/build/
cd ~/build
cat ~/build.sh.tmp | sed -e "s/^travis_run_checkout/#travis_run_checkout/" > ~/build.sh
bash ~/build.sh
