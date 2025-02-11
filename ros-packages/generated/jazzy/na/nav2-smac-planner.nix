{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  builtin-interfaces,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-core,
  nav2-costmap-2d,
  nav2-msgs,
  nav2-util,
  ompl,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_smac_planner";
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."nav2_smac_planner";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ];
  propagatedBuildInputs = [ angles builtin-interfaces geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-msgs ompl pluginlib rclcpp rclcpp-action rclcpp-lifecycle tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_smac_planner" = substituteSource {
      src = fetchgit {
        name = "nav2_smac_planner-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "14052985924be903d02034bb8ec28ccc5364fac5";
        hash = "sha256-BCKbIm7DuQh9w8gdJtJAUw1mD9hon6fgWYsSa4yHAxA=";
      };
    };
  });
  meta = {
    description = "Smac global planning plugin: A*, Hybrid-A*, State Lattice";
  };
})
