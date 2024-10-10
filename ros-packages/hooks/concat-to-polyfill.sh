if ! type concatTo > /dev/null 2>&1; then

# https://github.com/NixOS/nixpkgs/blob/cd0356b60f64644dcae43a566e16c6ddbd726166/pkgs/stdenv/generic/setup.sh#L387
# Accumulate flags from the named variables $2+ into the indexed array $1.
#
# Arrays are simply concatenated, strings are split on whitespace.
# Default values can be passed via name=default.
concatTo() {
    local -n targetref="$1"; shift
    local arg default name type
    for arg in "$@"; do
        IFS="=" read -r name default <<< "$arg"
        local -n nameref="$name"
        if [[ ! -n "${nameref[@]}" && -n "$default" ]]; then
            targetref+=( "$default" )
        elif type=$(declare -p "$name" 2> /dev/null); then
            case "${type#* }" in
                -A*)
                    echo "concatTo(): ERROR: trying to use concatTo on an associative array." >&2
                    return 1 ;;
                -a*)
                    targetref+=( "${nameref[@]}" ) ;;
                *)
                    if [[ "$name" = *"Array" ]]; then
                        nixErrorLog "concatTo(): $name is not declared as array, treating as a singleton. This will become an error in future"
                        # Reproduces https://github.com/NixOS/nixpkgs/pull/318614/files#diff-7c7ca80928136cfc73a02d5b28350bd900e331d6d304857053ffc9f7beaad576L359
                        targetref+=( ${nameref+"${nameref[@]}"} )
                    else
                        # shellcheck disable=SC2206
                        targetref+=( ${nameref-} )
                    fi
                    ;;
            esac
        fi
    done
}

fi
