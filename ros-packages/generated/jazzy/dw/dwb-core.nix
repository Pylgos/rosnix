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
  version = "1.3.11-1";
  src = finalAttrs.passthru.sources."dwb_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ dwb-msgs geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-util nav-2d-msgs nav-2d-utils nav-msgs pluginlib rclcpp sensor-msgs std-msgs tf2-ros visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dwb-msgs geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-util nav-2d-msgs nav-2d-utils nav-msgs pluginlib rclcpp sensor-msgs std-msgs tf2-ros visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dwb_core" = substituteSource {
      src = fetchgit {
        name = "dwb_core-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "5dd50a59f374dedba3a192ce51607fea7a0b8526";
        hash = "sha256-S6n8FM9bHszJvMGWS88He0gxMv6mkEvLu0uGgAl5Rp4=";
      };
    };
  });
  meta = {
    description = "DWB core interfaces package";
  };
})
