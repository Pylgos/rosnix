{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager,
  crane-plus-description,
  dynamixel-sdk,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  ros2-controllers,
  ros2controlcli,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "crane_plus_control";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."crane_plus_control";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ controller-manager crane-plus-description dynamixel-sdk hardware-interface pluginlib ros2-controllers ros2controlcli xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "crane_plus_control" = substituteSource {
      src = fetchgit {
        name = "crane_plus_control-source";
        url = "https://github.com/ros2-gbp/crane_plus-release.git";
        rev = "f86043420559134292b4b944c8414d4036319628";
        hash = "sha256-h8ld5m2UkNuD7iVkvurTqwCA4petUE2Fq89JrupEHpk=";
      };
    };
  });
  meta = {
    description = "CRANE+ V2 control package";
  };
})
