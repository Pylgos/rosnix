{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  control-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  generate-parameter-library,
  geometry-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rcutils,
  realtime-tools,
  ros2-control-cmake,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "control_toolbox";
  version = "4.2.0-1";
  src = finalAttrs.passthru.sources."control_toolbox";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ control-msgs filters generate-parameter-library geometry-msgs pluginlib rclcpp rcutils realtime-tools ros2-control-cmake tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gmock rclcpp-lifecycle ];
  passthru.sources = mkSourceSet (sources: {
    "control_toolbox" = substituteSource {
      src = fetchgit {
        name = "control_toolbox-source";
        url = "https://github.com/ros2-gbp/control_toolbox-release.git";
        rev = "23a14fd0a1a8c0620569f8f3b484117f7c58f8a7";
        hash = "sha256-DFzj1gpXUmrphTHRsDnD68HOhsvpFUTFADa0b9YQkJI=";
      };
    };
  });
  meta = {
    description = "The control toolbox contains modules that are useful across all controllers.";
  };
})
