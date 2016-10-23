if [[ -d "${PROJECTS}" ]]; then
    declare -A cd_aliases

    cd_aliases[cda]="preisvergleich-admin"
    cd_aliases[cdb]="preisvergleich-backend"
    cd_aliases[cdf]="preisvergleich-frontend"
    cd_aliases[cdh]="preisvergleich-behat"
    cd_aliases[cdl]="preisvergleich-library"
    cd_aliases[cdp]="profitmax"
    cd_aliases[cdsa]="snippie-api"

    for entry in "${(@k)cd_aliases}"; do
        [[ -d "${PROJECTS}/${cd_aliases[${entry}]}" ]] \
            && alias ${entry}="cd ${PROJECTS}/${cd_aliases[${entry}]}"
    done

    unset cd_aliases
fi
