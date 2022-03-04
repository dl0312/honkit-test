git config --global user.name 'Geon Lee' 
git config --global user.email 'leegun2003@gmail.com'


git checkout gh-pages

git clean -d -f -f

git status

# run honkit build
npx honkit build

# copy honkit build _book folder to root directory
cp -R _book/* .

# clean node_modules, _book foleders
git clean -fx node_modules
git clean -fx _book

git add .

# commit
git commit -a -m "publish honkit"

# push to gh-pages branch
git push -f origin gh-pages