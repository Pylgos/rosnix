if [[ -z ${__nix_rosnixSetupHook-} ]]; then
__nix_rosnixSetupHook=1  # Don't run this hook more than once.

_rosnixSetupHook_addSearchPath() {
  addToSearchPath _ROSNIX_SEARCH_PATH "$1"
}

_rosnixSetupHook_postHook() {
  source <(@setupHelper@)
}

addEnvHooks "$targetOffset" _rosnixSetupHook_addSearchPath
addEnvHooks "$hostOffset" _rosnixSetupHook_addSearchPath

postHooks+=(_rosnixSetupHook_postHook)

fi
