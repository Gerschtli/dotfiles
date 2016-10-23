function nvm-init() {
    local NVM="${HOME}/.nvm"
    if [[ -d "${NVM}" ]]; then
        echo "init nvm..."
        export NVM_DIR="${NVM}"
        [ -s "${NVM_DIR}/nvm.sh" ] && source "${NVM_DIR}/nvm.sh"
    else
        echo "folder not found: ${NVM}"
    fi
}
