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
  version = "1.3.7-1";
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
        rev = "f364759f1ed9b7012e0d5b494bd1f6673b5a119d";
        hash = "sha256-IsdW6mNq++QczHRu/pH7LY/pPu+VmuAmYRLIVHkJhiY=";
      };
    };
  });
  meta = {
    description = "Nav2 behavior tree wrappers, nodes, and utilities";
  };
})
