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
  version = "2.14.1-1";
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
        rev = "9b19bfc3296d13ab2095dccf344740d2b38152f8";
        hash = "sha256-D3ZlLUYqeCgFlhpW6RutnZh1SdQrfHOs1iq6wy2s50k=";
      };
    };
  });
  meta = {
    description = "The prbt_ikfast_manipulator_plugin package";
  };
})
