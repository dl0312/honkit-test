#!/bin/bash

. $HOME/.bashrc
  
# out of heap 에러 방지 https://github.com/gatsbyjs/gatsby/issues/15190#issuecomment-509906381
export NODE_OPTIONS="--max_old_space_size=4096" 

git config --global user.name 'Geon Lee' 
git config --global user.email 'leegun2003@gmail.com'

git fetch

git checkout gh-pages

git clean -d -f -f

# 최신 gh-pages 브랜치 정보를 가져와 rebase를 진행한다.
git pull origin gh-pages --rebase
git status

# gitbook 의존 파일을 설치하고 gitbook 빌드를 돌린다.
npx honkit build

# gitbook build로 생긴 _book폴더 아래 모든 정보를 현재 위치로 가져온다.
cp -R _book/* .

# node_modules폴더와 _book폴더를 지워준다.
git clean -fx node_modules
git clean -fx _book

# NOQA
git add .

# 커밋커밋!
git commit -a -m "publish honkit"

# gh-pages 브랜치에 PUSH!
git push origin gh-pages