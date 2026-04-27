{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
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
  rsl,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "control_toolbox";
  version = "6.3.0-1";
  src = finalAttrs.passthru.sources."control_toolbox";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros control-msgs filters generate-parameter-library geometry-msgs pluginlib rclcpp rcutils realtime-tools ros2-control-cmake rsl tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "fmt" "libexpected-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros control-msgs filters generate-parameter-library geometry-msgs pluginlib rclcpp rcutils realtime-tools ros2-control-cmake rsl tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "fmt" "libexpected-dev" ]; };
  checkInputs = [ ament-cmake-gmock rclcpp-lifecycle ];
  passthru.sources = mkSourceSet (sources: {
    "control_toolbox" = substituteSource {
      src = fetchgit {
        name = "control_toolbox-source";
        url = "https://github.com/ros2-gbp/control_toolbox-release.git";
        rev = "713ffd161d2b4f0458ccb5a0044c5d8de7a4281f";
        hash = "sha256-4dXT9X6VlUZeBVArGyJlgq8B+s0Oh5u5s2tI3Gw8E0Y=";
      };
    };
  });
  meta = {
    description = "The control toolbox contains modules that are useful across all controllers.";
  };
})
