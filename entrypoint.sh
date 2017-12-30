#!/bin/bash

# travis スクリプトの生成
cd ~/target
/home/travis/.travis/travis-build/bin/travis compile --no-interactive > ~/build.sh.tmp
# ビルド対象はgitからのチェックアウトではなく、ローカルリソースにするためコメントアウト
cat ~/build.sh.tmp | sed -e "s/^travis_run_checkout/#travis_run_checkout/" > ~/build.sh

# ビルド対象リソースの準備
if [ -d ~/build ]; then
    rm -R ~/build
fi
mkdir -p ~/build
# リソースをコピー
cp -r ~/target/* ~/build

# ビルド実行
cd ~/
bash ~/build.sh
