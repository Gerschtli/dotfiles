unhash -dm "*"

DROPBOX="${HOME}/Dropbox/Studium"
PROJECTS="${HOME}/projects"

if [[ -d "${DOTFILES_ROOT}" ]]; then
    hash -d dotfiles="${DOTFILES_ROOT}"
fi

if [[ -d "${PROJECTS}" ]]; then
    for i in "${PROJECTS}"/*(/); do
        hash -d "p-$(basename ${i})"="${i}"
    done

    if [[ -d "${PROJECTS}/cbn" ]]; then
        for i in "${PROJECTS}/cbn"/*(/); do
            hash -d "c-$(basename ${i})"="${i}"
        done
    fi
fi

if [[ -d "${DROPBOX}" ]]; then
    for i in "${DROPBOX}"/*(/); do
        # to lowercase, replace spaces with dashes and remove plus symbols
        hash -d "u-${${${$(basename ${i}):l}:gs/ /-/}:gs/+//}"="${i}"
    done
fi

unset DROPBOX PROJECTS
