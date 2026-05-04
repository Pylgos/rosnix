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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_resources_prbt_ikfast_manipulator_plugin";
  version = "2.14.1-2";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_ikfast_manipulator_plugin";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ generate-parameter-library moveit-core pluginlib rclcpp tf2-eigen tf2-eigen-kdl tf2-geometry-msgs tf2-kdl ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ generate-parameter-library moveit-core pluginlib rclcpp tf2-eigen tf2-eigen-kdl tf2-geometry-msgs tf2-kdl ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_prbt_ikfast_manipulator_plugin" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_ikfast_manipulator_plugin-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "0c224662130d3e306efd023adac654cdcd02f435";
        hash = "sha256-D3ZlLUYqeCgFlhpW6RutnZh1SdQrfHOs1iq6wy2s50k=";
      };
    };
  });
  meta = {
    description = "The prbt_ikfast_manipulator_plugin package";
  };
})
