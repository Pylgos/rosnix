{
  ament-cmake,
  ament-cmake-gtest,
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
  nav2-core,
  nav2-costmap-2d,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_behaviors";
  version = "1.3.6-1";
  src = finalAttrs.passthru.sources."nav2_behaviors";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-lifecycle ];
  propagatedBuildInputs = [ geometry-msgs nav2-behavior-tree nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-msgs pluginlib rclcpp-action tf2 tf2-geometry-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_behaviors" = substituteSource {
      src = fetchgit {
        name = "nav2_behaviors-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "4c55a2114785cbaaece26023fb8ac9eb1e9a3e71";
        hash = "sha256-twpjvat/azWsbkH9+hQ6Xjzn6mV+JhG1tQ97tCIY89A=";
      };
    };
  });
  meta = {
    description = "Nav2 behavior server";
  };
})
