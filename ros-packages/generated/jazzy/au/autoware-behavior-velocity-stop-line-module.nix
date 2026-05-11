{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-behavior-velocity-planner,
  autoware-behavior-velocity-planner-common,
  autoware-cmake,
  autoware-internal-planning-msgs,
  autoware-lint-common,
  autoware-motion-utils,
  autoware-route-handler,
  autoware-trajectory,
  autoware-utils-debug,
  autoware-utils-geometry,
  autoware-utils-rclcpp,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-geometry-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_behavior_velocity_stop_line_module";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_behavior_velocity_stop_line_module";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ autoware-behavior-velocity-planner autoware-behavior-velocity-planner-common autoware-internal-planning-msgs autoware-motion-utils autoware-route-handler autoware-trajectory autoware-utils-debug autoware-utils-geometry autoware-utils-rclcpp geometry-msgs pluginlib rclcpp tf2-geometry-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ autoware-behavior-velocity-planner autoware-behavior-velocity-planner-common autoware-internal-planning-msgs autoware-motion-utils autoware-route-handler autoware-trajectory autoware-utils-debug autoware-utils-geometry autoware-utils-rclcpp geometry-msgs pluginlib rclcpp tf2-geometry-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_behavior_velocity_stop_line_module" = substituteSource {
      src = fetchgit {
        name = "autoware_behavior_velocity_stop_line_module-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "1eeb378accb6f9969eb9b62d65d2aa711efaa853";
        hash = "sha256-BmOnEkWTW2+LIUTe/+QPGGZ9sIy9CuDr0AKRUaKbaVg=";
      };
    };
  });
  meta = {
    description = "The autoware_behavior_velocity_stop_line_module package";
  };
})
