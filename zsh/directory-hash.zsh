unhash -dm "*"

if [[ -d "${DOTFILES_ROOT}" ]]; then
    hash -d dotfiles="${DOTFILES_ROOT}"
fi

if [[ -d "${PROJECTS}" ]]; then
    for i in "${PROJECTS}"/*(/); do
        hash -d "proj-$(basename ${i})"="${i}"
    done
fi

DROPBOX="${HOME}/Dropbox/Studium"

if [[ -d "${DROPBOX}" ]]; then
    for i in "${DROPBOX}"/*(/); do
        # to lowercase, replace spaces with dashes and remove plus symbols
        hash -d "uni-${${${$(basename ${i}):l}:gs/ /-/}:gs/+//}"="${i}"
    done
fi

unset DROPBOX
