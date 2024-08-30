
# rebase with the main branch one branch outside of the flow

git checkout staging && 
git fetch origin &&
git reset --hard origin/master &&
git push origin staging -f

# rever pushed commit

git revert -m (1 source branch 2 merged branch) revert 
