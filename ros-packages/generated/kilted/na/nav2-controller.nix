{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lifecycle-msgs,
  mkSourceSet,
  nav-2d-msgs,
  nav-2d-utils,
  nav2-common,
  nav2-core,
  nav2-costmap-2d,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_controller";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."nav2_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles geometry-msgs lifecycle-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-2d-msgs nav-2d-utils pluginlib rcl-interfaces rclcpp rclcpp-components rclcpp-lifecycle tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles geometry-msgs lifecycle-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-2d-msgs nav-2d-utils pluginlib rcl-interfaces rclcpp rclcpp-components rclcpp-lifecycle tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_controller" = substituteSource {
      src = fetchgit {
        name = "nav2_controller-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "5115557b2c756330b7e822b99427dd296d83f839";
        hash = "sha256-kSMuUydkHrskEZGJxC23guF704AteLIJ9Xj4QsFK0Xg=";
      };
    };
  });
  meta = {
    description = "Controller action interface";
  };
})
