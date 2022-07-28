squash on remote

    $ git rebase -i origin/master~<X> master
    $ git push origin +master

> Tip:  remember that X it's the number of commit to squahs

> Tip:  remember to use as pick the top commit

change editor for commits

    $ git config core.editor "vim"


to remove locally all merged branches on remote

    git branch --merged >/tmp/merged-branches && \ vi /tmp/merged-branches && xargs git branch -d </tmp/merged-branches
