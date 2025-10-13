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
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "control_toolbox";
  version = "5.8.1-1";
  src = finalAttrs.passthru.sources."control_toolbox";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros control-msgs filters generate-parameter-library geometry-msgs pluginlib rclcpp rcutils realtime-tools ros2-control-cmake tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "fmt" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros control-msgs filters generate-parameter-library geometry-msgs pluginlib rclcpp rcutils realtime-tools ros2-control-cmake tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "fmt" ]; };
  checkInputs = [ ament-cmake-gmock rclcpp-lifecycle ];
  passthru.sources = mkSourceSet (sources: {
    "control_toolbox" = substituteSource {
      src = fetchgit {
        name = "control_toolbox-source";
        url = "https://github.com/ros2-gbp/control_toolbox-release.git";
        rev = "13f4cec94bda24e5d3fea6ccb9f83d774e91db13";
        hash = "sha256-ILV697KLu0gfhRUOGXWhzbvvwcB7N+WZe+rBZYQ04NA=";
      };
    };
  });
  meta = {
    description = "The control toolbox contains modules that are useful across all controllers.";
  };
})
