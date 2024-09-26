if [[ -z ${__nix_rosnixSetupHook-} ]]; then
__nix_rosnixSetupHook=1  # Don't run this hook more than once.

_rosnixSetupHook_addSearchPath() {
  addToSearchPath _ROSNIX_SEARCH_PATH "$1"
}

_rosnixSetupHook_postHook() {
  local fake_complete
  if ! type complete > /dev/null 2>&1; then
    complete() {
      :
    }
    fake_complete=1
  fi
  source <(@setupHelper@)
  if [[ -n $fake_complete ]]; then
    unset -f complete
  fi
}

addEnvHooks "$targetOffset" _rosnixSetupHook_addSearchPath
addEnvHooks "$hostOffset" _rosnixSetupHook_addSearchPath

postHooks+=(_rosnixSetupHook_postHook)

fi
