{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  dwb-core,
  dwb-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-2d-msgs,
  nav-2d-utils,
  nav2-common,
  nav2-costmap-2d,
  nav2-util,
  pluginlib,
  rcl-interfaces,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dwb_plugins";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."dwb_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ dwb-core dwb-msgs geometry-msgs nav2-common nav2-util nav-2d-msgs nav-2d-utils pluginlib rcl-interfaces rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dwb-core dwb-msgs geometry-msgs nav2-common nav2-util nav-2d-msgs nav-2d-utils pluginlib rcl-interfaces rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common nav2-costmap-2d rclcpp-lifecycle ];
  passthru.sources = mkSourceSet (sources: {
    "dwb_plugins" = substituteSource {
      src = fetchgit {
        name = "dwb_plugins-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "9212063326d1ea32148b43ae85a9c7484da0b517";
        hash = "sha256-eH0kFvlsEed6eg5YGLbU87pxBr5JQufGOg3jJLdiT18=";
      };
    };
  });
  meta = {
    description = "\n      Standard implementations of the GoalChecker\n      and TrajectoryGenerators for dwb_core\n  ";
  };
})
