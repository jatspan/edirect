#!/bin/bash -norc
if [ ! -e "$HOME/.bashrc" ]
then
  echo 'source ~/.bash_profile' > $HOME/.bashrc
fi
if [ ! -e "$HOME/.bash_profile" ]
then
  echo 'export PATH=$PATH:$HOME/edirect' > $HOME/.bash_profile
fi
if ! grep 'bash_profile' "$HOME/.bashrc" >/dev/null 2>&1
then
  echo 'source ~/.bash_profile' >> $HOME/.bashrc
fi
if ! grep '\$HOME/edirect' "$HOME/.bash_profile" >/dev/null 2>&1
then
  echo 'export PATH=$PATH:$HOME/edirect' >> $HOME/.bash_profile
fi
echo ""
echo "Welcome to Entrez Direct"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ "$DIR" != "$HOME/edirect" ]
then
echo ""
echo "The Entrez Direct scripts appear to be located in a non-standard area."
echo ""
echo "You may need to add the following command to the .bash_profile configuration file:"
echo ""
echo "  export PATH=\$PATH:$DIR"
echo ""
echo "in order to run programs without needing to prefix them with \"\./\"."
else
echo ""
echo "Please close this terminal window and open a new one to start working with Entrez Direct."
fi
