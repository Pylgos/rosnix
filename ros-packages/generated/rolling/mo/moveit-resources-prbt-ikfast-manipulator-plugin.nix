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
  version = "2.13.0-1";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_ikfast_manipulator_plugin";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ generate-parameter-library moveit-core pluginlib rclcpp tf2-eigen tf2-eigen-kdl tf2-geometry-msgs tf2-kdl ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_prbt_ikfast_manipulator_plugin" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_ikfast_manipulator_plugin-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "5fe2698772e80113fea51be1b597007bfff58cb3";
        hash = "sha256-jGSUw/lvIOVxtaRwl4NYd3xiosn3d9lZ+EBcFzJGaeM=";
      };
    };
  });
  meta = {
    description = "The prbt_ikfast_manipulator_plugin package";
  };
})
