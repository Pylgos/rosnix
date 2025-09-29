{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-core,
  nav2-costmap-2d,
  nav2-util,
  ompl,
  pluginlib,
  rcl-interfaces,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_smac_planner";
  version = "1.4.2-1";
  src = finalAttrs.passthru.sources."nav2_smac_planner";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp angles geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-util nav-msgs ompl pluginlib rcl-interfaces rclcpp rclcpp-lifecycle tf2 tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp angles geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-util nav-msgs ompl pluginlib rcl-interfaces rclcpp rclcpp-lifecycle tf2 tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_smac_planner" = substituteSource {
      src = fetchgit {
        name = "nav2_smac_planner-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "4c88999346584415f91872f1b4b04ec5854f95f9";
        hash = "sha256-W0MQHvFQUxPzZIMwZjx91eVQow/3DaZpbzyq8IXMTcU=";
      };
    };
  });
  meta = {
    description = "Smac global planning plugin: A*, Hybrid-A*, State Lattice";
  };
})
