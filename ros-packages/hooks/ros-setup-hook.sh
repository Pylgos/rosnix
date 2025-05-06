if [[ -z ${__nix_rosnixSetupHook-} ]]; then
__nix_rosnixSetupHook=1  # Don't run this hook more than once.

_rosnixSetupHook_addSearchPath() {
  local dir="$1/colcon-prefix"
  if [[ -d $dir ]]; then
    addToSearchPath _ROSNIX_SEARCH_PATH "$dir"
  fi
}

_rosnixSetupHook_postHook() {
  source <(@setupHelper@)
}

addEnvHooks "$targetOffset" _rosnixSetupHook_addSearchPath
addEnvHooks "$hostOffset" _rosnixSetupHook_addSearchPath

postHooks+=(_rosnixSetupHook_postHook)

fi
