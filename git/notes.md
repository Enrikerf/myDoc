squash on remote

    $ git rebase -i origin/X~<Y> X
    $ git push origin +X

> Tip:  remember that Y it's the number of commit to squahs

> Tip: remember that X it's the name of the branch

> Tip:  remember to use as pick the top commit

> Tip: git rebase --abort to abort

change editor for commits

    $ git config core.editor "vim"


to remove locally all merged branches on remote

    git fetch --prune

    configure to always prune in every fetch:
    git config --global fetch.prune true

    git branch --merged | grep -v "master" >/tmp/merged-branches && vi /tmp/merged-branches && xargs git branch -d </tmp/merged-branches

    git branch | grep -v "master" >/tmp/merged-branches && vi /tmp/merged-branches && xargs git branch -d </tmp/merged-branches

    press :wq to exit

    pending: put in the bash profile



git stash
git stash list
git stash pop -->
git stash show -p stash@{1} --> show git diff of stash list element
git stash drop stash@{0} --> remove element of stash list


