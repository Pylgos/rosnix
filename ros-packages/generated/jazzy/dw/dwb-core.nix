{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  dwb-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-2d-msgs,
  nav-2d-utils,
  nav-msgs,
  nav2-common,
  nav2-core,
  nav2-costmap-2d,
  nav2-util,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dwb_core";
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."dwb_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dwb-msgs geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-util nav-2d-msgs nav-2d-utils nav-msgs pluginlib rclcpp sensor-msgs std-msgs tf2-ros visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dwb_core" = substituteSource {
      src = fetchgit {
        name = "dwb_core-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "672b33990991a29938fbf88006b3bc83fc6d220a";
        hash = "sha256-ebH0hyoYC7FSIPieoBek4GBPSOCytJlln8sjyQzfRfs=";
      };
    };
  });
  meta = {
    description = "DWB core interfaces package";
  };
})
