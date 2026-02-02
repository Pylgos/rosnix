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
  version = "1.3.11-1";
  src = finalAttrs.passthru.sources."nav2_behavior_tree";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ behaviortree-cpp builtin-interfaces geometry-msgs lifecycle-msgs nav2-common nav2-msgs nav2-util nav-msgs rclcpp rclcpp-action rclcpp-lifecycle sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ behaviortree-cpp builtin-interfaces geometry-msgs lifecycle-msgs nav2-common nav2-msgs nav2-util nav-msgs rclcpp rclcpp-action rclcpp-lifecycle sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_behavior_tree" = substituteSource {
      src = fetchgit {
        name = "nav2_behavior_tree-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "95e8d1eb6c587fe78f8e37b0a8988554c29dc053";
        hash = "sha256-FfPwtjwjqzSRj8biRUazaFjzceTBk+TfDUbgOYqItIc=";
      };
    };
  });
  meta = {
    description = "Nav2 behavior tree wrappers, nodes, and utilities";
  };
})
