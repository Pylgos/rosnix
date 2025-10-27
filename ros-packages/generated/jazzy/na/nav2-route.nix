{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  backward-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  launch-testing,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-core,
  nav2-costmap-2d,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_route";
  version = "1.3.10-1";
  src = finalAttrs.passthru.sources."nav2_route";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles backward-ros geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-lifecycle std-msgs tf2 tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libnanoflann-dev" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles backward-ros geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-lifecycle std-msgs tf2 tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libnanoflann-dev" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_route" = substituteSource {
      src = fetchgit {
        name = "nav2_route-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "7519bc0b89bc140d0209f5a44f5a66a543ae4e64";
        hash = "sha256-nHDPLH2oyXtDL+pNcIcN1C8B6KQRZJxEFSUkW4w/ZJY=";
      };
    };
  });
  meta = {
    description = "A Route Graph planner to compliment the Planner Server";
  };
})
