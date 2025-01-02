{
  makeSetupHook,
  rosSetupHelper,
  bash,
  writeScript,
}:
makeSetupHook {
  name = "ros-setup-hook";
  substitutions = {
    setupHelper = "${rosSetupHelper}/bin/setup-helper";
  };
} ./ros-setup-hook.sh
