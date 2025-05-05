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
  version = "1.3.6-1";
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
        rev = "3534ad144739968e3bf2d1c41aecbe98858885c1";
        hash = "sha256-DxwumJc6RZnd0iLPfAw6TOnBEVTIZkUDx1obK4TG0g8=";
      };
    };
  });
  meta = {
    description = "DWB core interfaces package";
  };
})
