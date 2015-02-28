for f in `ls config/`;
do
    echo "install config/$f to ~/.$f"
    if [ -f ~/."$f" ];
    then
        cp ~/."$f" ~/."$f".bak
    fi
    ln -sf "$PWD/config/$f" ~/."$f"
done
