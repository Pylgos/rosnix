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
  launch,
  launch-ros,
  launch-testing,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-msgs,
  nav2-util,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_map_server";
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."nav2_map_server";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-ros launch-testing nav2-common nav2-msgs nav2-util nav-msgs rclcpp rclcpp-lifecycle std-msgs tf2 yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "graphicsmagick" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_map_server" = substituteSource {
      src = fetchgit {
        name = "nav2_map_server-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "f073ad9ed734307e4cd21bd2f36b4ceea101d266";
        hash = "sha256-UU/cg4J1ZPJnCAC+eMDA9LTe4LFFTTybPbQxrR0tGaE=";
      };
    };
  });
  meta = {
    description = "Refactored map server for ROS2 Navigation";
  };
})
