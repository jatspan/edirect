#!/bin/bash -norc

DIR="$( cd "$( dirname "$0" )" && pwd )"

if [ ! -e "$HOME/.bashrc" ]
then
  echo 'source ~/.bash_profile' > $HOME/.bashrc
fi
if [ ! -e "$HOME/.bash_profile" ]
then
  echo "export PATH=\$PATH:$DIR" > $HOME/.bash_profile
fi

if ! grep 'bash_profile' "$HOME/.bashrc" >/dev/null 2>&1
then
  echo 'source ~/.bash_profile' >> $HOME/.bashrc
fi
if ! grep "PATH.*edirect" "$HOME/.bash_profile" >/dev/null 2>&1
then
  echo "export PATH=\$PATH:$DIR" >> $HOME/.bash_profile
fi

echo ""
echo "ENTREZ DIRECT HAS BEEN SUCCESSFULLY INSTALLED AND CONFIGURED"
echo ""
