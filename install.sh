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
if [[ $ostype != "msys" ]]
then
    echo install vim configuration
    ln -sf $PWD/vim/vimrc ~/.vimrc
    if [[ -d ~/.vim ]]
    then
        if [[ -d ~/.vim.bak ]]
        then
            rm -rf ~/.vim.bak
        fi
        mv ~/.vim ~/.vim.bak
    fi
    ln -sf $PWD/vim ~/.vim
fi

# Install system specific scripts
if [[ $ostype = "cygwin" ]]; then
    echo install Cygwin specific scripts
    ln -sf $PWD/bin/xclip-cygwin.sh $PWD/bin/xclip
fi

# Install dictionary
if [[ $ostype != "msys" ]]
then
    ln -sf $PWD/stardict ~/.stardict
fi

# Install fzf
# if [[ $ostype != "msys" ]]
# then
#     if [[ ! -d ~/.fzf ]]
#     then
#         if [[ -f fzf-master.zip ]]
#         then
#             # Install manually
#             unzip fzf-mater.zip
#             mv fzf-master ~/.fzf
#             ~/.fzf/install
#         else
#             # Install online
#             echo install fzf
#             git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
#                 ~/.fzf/install
#         fi
#     fi
# fi
