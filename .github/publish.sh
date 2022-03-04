#!/bin/bash

. $HOME/.bashrc

git config --global user.name 'Geon Lee' 
git config --global user.email 'leegun2003@gmail.com'

git fetch

git status

git checkout gh-pages

git clean -d -f -f

# 최신 gh-pages 브랜치 정보를 가져와 rebase를 진행한다.
git pull origin gh-pages --rebase -f
git status

# run honkit build
npx honkit build

# copy honkit build _book folder to root directory
cp -R _book/* .

# clean node_modules, _book foleders
git clean -fx node_modules
git clean -fx _book

# NOQA
git add .

# 커밋커밋!
git commit -a -m "publish honkit"

# gh-pages 브랜치에 PUSH!
git push origin gh-pages