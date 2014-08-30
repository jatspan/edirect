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
echo "Welcome to Entrez Direct"
echo ""
echo "Please close this terminal window and open a new one to start working with Entrez Direct."
echo ""
echo "If the 'esearch -version' command reports \"command not found\", you may need to add the"
echo "following line to the (invisible) .bash_profile configuration file in your home directory:"
echo ""
echo "  export PATH=\$PATH:$DIR"
echo ""
echo "editing it if necessary to indicate the exact path to the edirect directory."
echo ""
