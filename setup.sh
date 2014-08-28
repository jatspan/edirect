#!/bin/bash -norc
if [ ! -e "$HOME/.bashrc" ]
then
  echo 'source ~/.bash_profile' > $HOME/.bashrc
fi
if [ ! -e "$HOME/.bash_profile" ]
then
  echo 'export PATH=$PATH:$HOME/edirect' > $HOME/.bash_profile
fi
if ! grep '\$HOME/edirect' "$HOME/.bash_profile" >/dev/null 2>&1
then
  echo 'export PATH=$PATH:$HOME/edirect' >> $HOME/.bash_profile
fi
