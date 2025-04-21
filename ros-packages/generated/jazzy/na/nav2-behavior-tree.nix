{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  behaviortree-cpp,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lifecycle-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-msgs,
  nav2-util,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  test-msgs,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_behavior_tree";
  version = "1.3.6-1";
  src = finalAttrs.passthru.sources."nav2_behavior_tree";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ behaviortree-cpp builtin-interfaces geometry-msgs lifecycle-msgs nav2-common nav2-msgs nav2-util nav-msgs rclcpp rclcpp-action rclcpp-lifecycle sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_behavior_tree" = substituteSource {
      src = fetchgit {
        name = "nav2_behavior_tree-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "79c99fa9dce16095cff7e1039024d6d540dc3faf";
        hash = "sha256-6ZAxH76cFzVr9xeKkJBXwn3FSam0UHYnYwUjfxlsVp4=";
      };
    };
  });
  meta = {
    description = "Nav2 behavior tree wrappers, nodes, and utilities";
  };
})
