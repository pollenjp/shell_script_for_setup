#!/bin/bash -eux

# execute by user

## save current
CWD=$(pwd)

#--------------------------------------------------------------------------------
#  .vimrc
##--------------------
##  git clone dotfiles
##--------------------
cd $HOME
directory1="${HOME}/dotfiles"
if [ ! -d "${directory1}" ]; then
  git clone git@bitbucket.org:pollenjp/dotfiles.git
fi

##----------------------------------------
##  .vim/
###--------------------
directory1="${HOME}/.config"
if [ ! -d "${directory1}" ]; then
  mkdir "${directory1}"
fi

SOURCEVIMDIR="${HOME}/dotfiles/_vim"
TARGETVIMDIR="${HOME}/.config/nvim"
if [ ! -h ${TARGETVIMDIR} ]; then
  if [ -d ${TARGETVIMDIR} ]; then
    rm -r ${TARGETVIMDIR}
  fi
  ln -s ${SOURCEVIMDIR} ${TARGETVIMDIR}
fi

SOURCEVIMDIR="${HOME}/dotfiles/_vim"
TARGETVIMDIR="${HOME}/.vim"
if [ ! -h ${TARGETVIMDIR} ]; then
  if [ -d ${TARGETVIMDIR} ]; then
    rm -r ${TARGETVIMDIR}
  fi
  ln -s ${SOURCEVIMDIR} ${TARGETVIMDIR}
fi

###--------------------
###  .vimrc
###--------------------
file1="${HOME}/dotfiles/_vimrc"
file2="${HOME}/.config/nvim/init.vim"
file3="${HOME}/.vimrc"
if [ ! -h $file2 ]; then
  ln -s "$file1" "$file2"
fi
if [ ! -h ${file3} ]; then
  ln -s "$file1" "$file3"
fi

##----------------------------------------
##  - make bundle dir
##  - fetch neobundle
###--------------------
echo "Begin fetching NeoBundle..."
directory1="${HOME}/dotfiles/_vim/bundle"
if [ ! -e ${directory1} ]; then
  mkdir -p ${directory1}
fi
directory2="${directory1}/neobundle.vim"
if [ ! -e ${directory2} ]; then
  git clone https://github.com/Shougo/neobundle.vim ${directory2}
fi

### https://github.com/VundleVim/Vundle.vim
directory3="${directory1}/Vundle.vim"
if [ ! -e ${directory3} ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ${directory3}
fi

#--------------------
#  Back to working directory
#--------------------
cd ${CWD}
