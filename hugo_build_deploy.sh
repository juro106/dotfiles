#!/bin/bash

# git add, commit, push まで一度に行う
git_add_commit_push() {
  # 全てステージに乗せる
  git add -A;
  MSG=`date "+%Y%m%d_%H-%M-%S"`
  git commit -m "${MSG}"
  CULLENT_BRANCH=`git rev-parse --abbrev-ref HEAD`;
  git push origin ${CULLENT_BRANCH};
  # コミット対象のファイルを確認
  # git status;
  # read -p "Commit with this conent. OK? (y/N): " yesno
  # case "$yesno" in
  #     # yes
  #     [yY]*) read -p "Input Commit Message: " msg;
  #     git commit -m "$msg";
  #     CULLENT_BRANCH=`git rev-parse --abbrev-ref HEAD`;
  #     git push origin ${CULLENT_BRANCH};;
  #     # no
  #     *) echo "Quit.";;
  # esac
}

hugog() {
  cur_dir=$(pwd)
  git_root=$(git rev-parse --show-toplevel)
  cd $git_root
  hugo --minify --cleanDestinationDir
  cd "$git_root/public"
  # git push 実行
  git_add_commit_push
  cd $cur_dir
}

hugog
