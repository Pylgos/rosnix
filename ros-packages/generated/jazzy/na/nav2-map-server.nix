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
  version = "1.3.8-1";
  src = finalAttrs.passthru.sources."nav2_map_server";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ launch-ros launch-testing nav2-common nav2-msgs nav2-util nav-msgs rclcpp rclcpp-lifecycle std-msgs tf2 yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "graphicsmagick" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-ros launch-testing nav2-common nav2-msgs nav2-util nav-msgs rclcpp rclcpp-lifecycle std-msgs tf2 yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "graphicsmagick" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_map_server" = substituteSource {
      src = fetchgit {
        name = "nav2_map_server-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "3f789082944ee0aee8abae3d50cbb3678fa4ca16";
        hash = "sha256-VqRdHSc8YQDNGsBvctAOfUX7tjRBFWZy5ZkF7jnw/WE=";
      };
    };
  });
  meta = {
    description = "\n    Refactored map server for ROS2 Navigation\n  ";
  };
})
