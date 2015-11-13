#!/usr/bin/env bash

if [[ $OSTYPE = "linux-gnu" ]]; then
    ostype="linux"
elif [[ $OSTYPE = "cygwin" ]]; then
    ostype="cygwin"
elif [[ $OSTYPE = "darwin"* ]]; then
    ostype="darwin"
elif [[ $OSTYPE = "msys" ]]; then
    ostype="msys"
elif [[ $OSTYPE = "freebsd"* ]]; then
    ostype="freebsd"
else
    ostype="unknown"
fi

# Install all configuration files under dotconfig/
dotconfdir="dotconfig"
for f in `ls $dotconfdir/`;
do
    echo install $dotconfdir/$f to ~/.$f
    if [[ -f ~/.$f ]]
    then
        cp ~/.$f ~/.$f.bak
    fi
    ln -sf $PWD/$dotconfdir/$f ~/.$f
done

# Install vim configuration
echo install vim configuration
if [[ -d ~/.vim ]]
then
    if [[ -d ~/.vim.bak ]]
    then
        rm -rf ~/.vim.bak
    fi
    mv ~/.vim ~/.vim.bak
fi
ln -sf $PWD/vim ~/.vim

# Install scripts
ln -sf $PWD/scripts/find_port.py $PWD/bin/

# Install system specific scripts
if [[ $ostype = "cygwin" ]]; then
    echo install Cygwin specific scripts
    ln -sf $PWD/scripts/xclip-cygwin.sh $PWD/bin/xclip
fi
