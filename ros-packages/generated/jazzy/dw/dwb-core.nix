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
  version = "1.3.4-1";
  src = finalAttrs.passthru.sources."dwb_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dwb-msgs geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-util nav-2d-msgs nav-2d-utils nav-msgs pluginlib rclcpp sensor-msgs std-msgs tf2-ros visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dwb_core" = substituteSource {
      src = fetchgit {
        name = "dwb_core-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "fbb7702e7e3fa5f7dca5281c86a2ba8e31a3e2e5";
        hash = "sha256-X7BLFOOVrYKj15hKqambGnVUSm/20HM6zCIqIpwuPUU=";
      };
    };
  });
  meta = {
    description = "DWB core interfaces package";
  };
})
