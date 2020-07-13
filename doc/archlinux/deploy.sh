#!/bin/sh
################################################################################
# Arch Linux auto-deploy script
################################################################################
PrintUsage(){
  echo [ Usage ]
  echo -S -s   \$2=_repo_name, \$3=_stowdir, use default without specified.
  echo -H -h   Print this 'help'
  return 0
}

case $1 in
  -S|-s) shift
  ;;
  *) PrintUsage && exit 0
  ;;
esac

# User specified variable
_repo_name=${1:-dotfile} # Should be the same as remote repo
_stowdir=${2:-mega}

echo -e "!!! Warnning !!! Will REMOVE ALL of your dotfiles (y/n) (default n): \c"
read choise
case "$choise" in
y|Y)
  [[ -d $STOW_DIR ]] && "$STOW_DIR/$_repo_name"/_stow.sh -U && rm -rf "$STOW_DIR/$_repo_name"
  rm -rf "$HOME"/.local "$HOME"/.config "$HOME"/.cache "$HOME"/.*
;;
*)
  echo 'operation abort.'
  exit 0
;;
esac

_repo_dir=$_stowdir/$_repo_name

# clone the dotfile repo
if [[ -d $_repo_dir ]] ; then
  git -C "$_repo_dir" fetch --all --recursive-submodules=yes
  git -C "$_repo_dir" reset --hard origin/master
else
  git clone --recursive "https://github.com/madobet/$_repo_name" "$_repo_dir"
fi

# export necessary variables
. "$_repo_dir"/.profile

# just stow it
"$_repo_dir"/_stow.sh -I

# call the initialization script
"$_repo_dir"/_init.sh

exit 0
