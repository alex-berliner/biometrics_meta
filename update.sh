git pull
git submodule foreach "git checkout master && git pull && git push"
git add -A
git commit -m "`date`"
git push
