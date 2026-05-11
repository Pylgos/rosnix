{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-internal-planning-msgs,
  autoware-lint-common,
  autoware-motion-utils,
  autoware-motion-velocity-planner-common,
  autoware-perception-msgs,
  autoware-planning-msgs,
  autoware-signal-processing,
  autoware-test-utils,
  autoware-utils-debug,
  autoware-utils-geometry,
  autoware-utils-rclcpp,
  autoware-utils-system,
  autoware-utils-uuid,
  autoware-utils-visualization,
  autoware-vehicle-info-utils,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  grid-map-core,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_motion_velocity_obstacle_stop_module";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_motion_velocity_obstacle_stop_module";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-internal-planning-msgs autoware-motion-utils autoware-motion-velocity-planner-common autoware-perception-msgs autoware-planning-msgs autoware-signal-processing autoware-utils-debug autoware-utils-geometry autoware-utils-rclcpp autoware-utils-system autoware-utils-uuid autoware-utils-visualization autoware-vehicle-info-utils geometry-msgs grid-map-core pluginlib rclcpp tf2 visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-internal-planning-msgs autoware-motion-utils autoware-motion-velocity-planner-common autoware-perception-msgs autoware-planning-msgs autoware-signal-processing autoware-utils-debug autoware-utils-geometry autoware-utils-rclcpp autoware-utils-system autoware-utils-uuid autoware-utils-visualization autoware-vehicle-info-utils geometry-msgs grid-map-core pluginlib rclcpp tf2 visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-ros ament-lint-auto autoware-lint-common autoware-test-utils ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_motion_velocity_obstacle_stop_module" = substituteSource {
      src = fetchgit {
        name = "autoware_motion_velocity_obstacle_stop_module-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "9477f3a0d64655e190a278fac1b0ee11abce79e5";
        hash = "sha256-bYQ9sflvLLHSkttNoKd9iQp0ELdJ+uZdchqM5L2Fx9I=";
      };
    };
  });
  meta = {
    description = "obstacle stop feature in motion_velocity_planner";
  };
})
