#!/bin/bash
cd "$(dirname "$0")"
git pull
function doIt() {
  [ ! -d ~/.vim ] && mkdir ~/.vim  
  [ ! -d ~/Projects ] && mkdir ~/Projects  

  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av . ~

  if [ ! -f ~/.git_extra ]; then
    echo "Creating .git_extra\n"
    
    read -p "Enter your name: " name
    read -p "Enter your email address used to identify the version control: " email

    echo  '# Git credentials' >> ~/.git_extra
    echo  "GIT_AUTHOR_NAME='$name'">> ~/.git_extra
    echo  'GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"' >> ~/.git_extra
    echo  'git config --global user.name "$GIT_AUTHOR_NAME"' >> ~/.git_extra
    echo  "GIT_AUTHOR_EMAIL='$email'" >> ~/.git_extra
    echo  'GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"' >> ~/.git_extra
    echo  'git config --global user.email "$GIT_AUTHOR_EMAIL"' >> ~/.git_extra
    echo  'git config --global core.editor "s -w"' >> ~/.git_extra
    echo  'git config --global color.ui true' >> ~/.git_extra
  fi
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	[[ $REPLY =~ ^[Yy]$ ]] && doIt
fi
unset doIt
source ~/.bash_profile