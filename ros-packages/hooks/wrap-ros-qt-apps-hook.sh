# shellcheck shell=bash
if [[ -z "${__nix_wrapRosQtAppsHook-}" ]]; then
__nix_wrapRosQtAppsHook=1  # Don't run this hook more than once.

wrapRosQtAppsHook() {
    # skip this hook when requested
    [ -z "${dontWrapRosQtApps-}" ] || return 0

    # guard against running multiple times (e.g. due to propagation)
    [ -z "$wrapRosQtAppsHookHasRun" ] || return 0
    wrapRosQtAppsHookHasRun=1

    local targetDirs=( "$prefix/bin" "$prefix/lib" )
    echo "wrapping Qt applications in ${targetDirs[@]}"

    for targetDir in "${targetDirs[@]}"
    do
        [ -d "$targetDir" ] || continue

        find "$targetDir" ! -type d -executable -print0 | while IFS= read -r -d '' file
        do
            isELF "$file" || isMachO "$file" || isScript "$file" || continue
            local basename
            basename="$(basename "$file")"
            # skip libraries
            case "$basename" in
                *.so*|*.dylib|*.a)
                    continue
                    ;;
            esac

            if [ -f "$file" ]
            then
                echo "wrapping $file"
                wrapQtApp "$file"
            elif [ -h "$file" ]
            then
                target="$(readlink -e "$file")"
                echo "wrapping $file -> $target"
                rm "$file"
                makeQtWrapper "$target" "$file"
            fi
        done
    done
}

fixupOutputHooks+=(wrapRosQtAppsHook)

fi
