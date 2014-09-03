#!/bin/bash -norc

DIR="$( cd "$( dirname "$0" )" && pwd )"

cat <<EOF

Trying to establish local installations of any missing Perl modules
(as logged in $DIR/setup-deps.log).
Please be patient, as this step may take a little while.
EOF
mkdir -p "$DIR/_cpan/CPAN"
echo '1;' >> "$DIR/_cpan/CPAN/MyConfig.pm"
perl -I"$DIR/_cpan" "$DIR/setup-deps.pl" </dev/null >"$DIR/setup-deps.log" 2>&1

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
