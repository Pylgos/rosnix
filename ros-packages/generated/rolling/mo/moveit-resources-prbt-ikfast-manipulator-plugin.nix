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
  version = "2.13.2-1";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_ikfast_manipulator_plugin";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ generate-parameter-library moveit-core pluginlib rclcpp tf2-eigen tf2-eigen-kdl tf2-geometry-msgs tf2-kdl ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ generate-parameter-library moveit-core pluginlib rclcpp tf2-eigen tf2-eigen-kdl tf2-geometry-msgs tf2-kdl ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_prbt_ikfast_manipulator_plugin" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_ikfast_manipulator_plugin-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "8ac5108aaa13ccb18cc28589e217566599beee17";
        hash = "sha256-Fvnd5eLyosPgs3a17tX0mwtfykVOycSrb5hid4oxyTk=";
      };
    };
  });
  meta = {
    description = "The prbt_ikfast_manipulator_plugin package";
  };
})
