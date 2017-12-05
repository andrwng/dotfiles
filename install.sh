#!/usr/bin/bash
#
# Install dotfiles to $HOME.

dot_home="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
date=`date +%Y-%m-%d`

# Create a hidden symlink for the input config file.
# Arg $1: config type (e.g. "vimrc")
symlink_hidden() {
  config_file=$HOME/.$1

  if [[ -h $config_file ]]; then
    # Remove any existing links.
    echo "Clearing existing link $config_file";
    rm $config_file;
  elif [[ -e $config_file ]]; then
    # Back up any existing files.
    config_backup=$config_file.bak.$date;
    echo "Moving existing $1 to $config_backup";
    mv $config_file $config_backup;
  fi
  ln -s $dot_home/$1 $config_file
}

for config in vimrc tmux.conf inputrc
do
  symlink_hidden "$config"
done

# Use the new .inputrc.
bind -f $HOME/.inputrc

# Install Vim-Plug.
if [[ ! -e "$HOME/.vim/autoload/plug.vim" ]]; then
  curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Create the plugin directory.
if [[ ! -e "$HOME/.vim/plugged" ]]; then
  mkdir $HOME/.vim/plugged
fi

# Install the vim plugins.
vi +PlugUpdate +qall
