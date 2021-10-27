#/bin/bash
base=`pwd`
#projects
cd "$base/storage/code/api"
pwd
git branch
git pull
cd "$base/storage/code/console"
pwd
git branch
git pull
#packages
cd "$base/storage/code/packages/coding-standard"
pwd
git branch
git pull
cd "$base/storage/code/packages/common"
pwd
git branch
git pull
cd "$base/storage/code/packages/components"
pwd
git branch
git pull
cd "$base/storage/code/packages/constants"
pwd
git branch
git pull
#forked
  cd "$base/storage/code/packages/forked/openapi-reader"
  pwd
  git branch
  git pull
  cd "$base/storage/code/packages/forked/openapi-validation-middleware"
  pwd
  git branch
  git pull
cd "$base/storage/code/packages/models"
pwd
git branch
git pull
cd "$base/storage/code/packages/plugins"
pwd
git branch
git pull
#services
  cd "$base/storage/code/packages/services/api-validation-service"
  pwd
  git branch
  git pull
  cd "$base/storage/code/packages/services/authentication-service"
  pwd
  git branch
  git pull
  cd "$base/storage/code/packages/services/cart-service"
  pwd
  git branch
  git pull
  cd "$base/storage/code/packages/services/comment-service"
  pwd
  git branch
  git pull
  cd "$base/storage/code/packages/services/iam-service"
  pwd
  git branch
  git pull
  cd "$base/storage/code/packages/services/purchase-service"
  pwd
  git branch
  git pull
  cd "$base/storage/code/packages/services/rest-logger-service"
  pwd
  git branch
  git pull
  cd "$base/storage/code/packages/services/service"
  pwd
  git branch
  git pull
  cd "$base/storage/code/packages/services/store-service"
  pwd
  git branch
  git pull
  cd "$base/storage/code/packages/services/tax-service"
  pwd
  git branch
  git pull
  cd "$base/storage/code/packages/services/two-factor-service"
  pwd
  git branch
  git pull
  cd "$base/storage/code/packages/services/user-service"
  pwd
  git branch
  git pull
  cd "$base/storage/code/packages/services/wallet-service"
  pwd
  git branch
  git pull
  cd "$base/storage/code/packages/services/wishlist-service"
  pwd
  git branch
  git pull
#stock
  cd "$base/storage/code/packages/services/stock/stock-reservation"
  pwd
  git branch
  git pull
cd "$base"
