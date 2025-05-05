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
  version = "1.3.6-1";
  src = finalAttrs.passthru.sources."nav2_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav2-behavior-tree nav2-common nav2-costmap-2d nav2-util nav-msgs pluginlib rclcpp rclcpp-lifecycle std-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-behavior-tree nav2-common nav2-costmap-2d nav2-util nav-msgs pluginlib rclcpp rclcpp-lifecycle std-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_core" = substituteSource {
      src = fetchgit {
        name = "nav2_core-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "b37c3787c7080839aad63a082661444d9cb93d59";
        hash = "sha256-IAdSu/kuhr4Efa2ChoaYkWs1g0PoNhhrqCQj2ssNJR0=";
      };
    };
  });
  meta = {
    description = "A set of headers for plugins core to the Nav2 stack";
  };
})
