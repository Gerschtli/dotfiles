# Fix java problem on gentoo
if available wmname; then
    alias fix-java="wmname LG3D && export AWT_TOOLKIT=MToolkit"
fi

if available docker; then
    alias dropbox="docker exec -it dropbox dropbox"
    alias dropbox-start="docker start dropbox"
    alias dropbox-stop="docker stop dropbox"
    alias dropbox-create="docker run -d --name=dropbox \
        -v ${HOME}/Dropbox:/dbox/Dropbox \
        -v ${HOME}/.dropbox:/dbox/.dropbox \
        -e DBOX_UID=$(id -u) -e DBOX_GID=$(id -g) janeczku/dropbox"
fi
