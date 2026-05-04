{
  ament-cmake,
  ament-cmake-python,
  ament-index-cpp,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclpy,
  ros-environment,
  rosSystemPackages,
  substituteSource,
  yasmin,
  yasmin-factory,
  yasmin-ros,
  yasmin-viewer,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yasmin_demos";
  version = "5.0.0-2";
  src = finalAttrs.passthru.sources."yasmin_demos";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-index-cpp example-interfaces geometry-msgs nav-msgs pluginlib rclcpp rclcpp-action rclpy ros-environment yasmin yasmin-factory yasmin-ros yasmin-viewer ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ ament-index-cpp example-interfaces geometry-msgs nav-msgs pluginlib rclcpp rclcpp-action rclpy ros-environment yasmin yasmin-factory yasmin-ros yasmin-viewer ];
  passthru.sources = mkSourceSet (sources: {
    "yasmin_demos" = substituteSource {
      src = fetchgit {
        name = "yasmin_demos-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "0e6c41390430723c9656b6aee4a92ef96877a54b";
        hash = "sha256-rwGwq8Qa+V33B0NuJKqELfT46j8Pw3iltYe/Rz60m4I=";
      };
    };
  });
  meta = {
    description = "Demos of YASMIN (Yet Another State MachINe)";
  };
})
