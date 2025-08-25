{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-behavior-tree,
  nav2-common,
  nav2-costmap-2d,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_core";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."nav2_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav2-behavior-tree nav2-common nav2-costmap-2d nav2-util nav-msgs pluginlib rclcpp rclcpp-lifecycle tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-behavior-tree nav2-common nav2-costmap-2d nav2-util nav-msgs pluginlib rclcpp rclcpp-lifecycle tf2-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_core" = substituteSource {
      src = fetchgit {
        name = "nav2_core-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "7f4908c432308e904f88fe4e49e5bb004fb900b8";
        hash = "sha256-kVHO6XHsO+uE6cQwLa66LP8quXSC3RBJIgCY1/T75MM=";
      };
    };
  });
  meta = {
    description = "A set of headers for plugins core to the Nav2 stack";
  };
})
