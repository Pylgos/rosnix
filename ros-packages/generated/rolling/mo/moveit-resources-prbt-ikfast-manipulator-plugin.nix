{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  mkSourceSet,
  moveit-core,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-eigen,
  tf2-eigen-kdl,
  tf2-geometry-msgs,
  tf2-kdl,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_resources_prbt_ikfast_manipulator_plugin";
  version = "2.11.0-1";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_ikfast_manipulator_plugin";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ generate-parameter-library moveit-core pluginlib rclcpp tf2-eigen tf2-eigen-kdl tf2-geometry-msgs tf2-kdl ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_resources_prbt_ikfast_manipulator_plugin" = substituteSource {
        src = fetchgit {
          name = "moveit_resources_prbt_ikfast_manipulator_plugin-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "98d4ba0caa9b752241cc52ae18c4ec5fd200bbfb";
          hash = "sha256-XrTccUeeXR+i08B4Ai2KfSBj8vR1Rtu7TgrYvm1yIWU=";
        };
      };
    });
  };
  meta = {
    description = "The prbt_ikfast_manipulator_plugin package";
  };
})
