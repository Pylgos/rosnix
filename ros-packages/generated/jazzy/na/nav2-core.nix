{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  launch-testing,
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
  std-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_core";
  version = "1.3.4-1";
  src = finalAttrs.passthru.sources."nav2_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-behavior-tree nav2-common nav2-costmap-2d nav2-util nav-msgs pluginlib rclcpp rclcpp-lifecycle std-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_core" = substituteSource {
      src = fetchgit {
        name = "nav2_core-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "2a4d41daed7ede3bfe66d044a9e50c7e9d3c74b2";
        hash = "sha256-l13d/SnvDVwPWHyMchbOv1AA52DOL9n+W4KixLlq0JU=";
      };
    };
  });
  meta = {
    description = "A set of headers for plugins core to the Nav2 stack";
  };
})
