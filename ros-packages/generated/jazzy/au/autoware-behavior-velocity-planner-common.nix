{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-adapi-v1-msgs,
  autoware-cmake,
  autoware-internal-debug-msgs,
  autoware-internal-planning-msgs,
  autoware-interpolation,
  autoware-lanelet2-extension,
  autoware-lanelet2-utils,
  autoware-lint-common,
  autoware-map-msgs,
  autoware-motion-utils,
  autoware-objects-of-interest-marker-interface,
  autoware-perception-msgs,
  autoware-planning-factor-interface,
  autoware-planning-msgs,
  autoware-route-handler,
  autoware-test-utils,
  autoware-trajectory,
  autoware-utils-debug,
  autoware-utils-geometry,
  autoware-utils-rclcpp,
  autoware-utils-system,
  autoware-utils-visualization,
  autoware-vehicle-info-utils,
  autoware-velocity-smoother,
  buildAmentCmakePackage,
  diagnostic-msgs,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  pcl-conversions,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_behavior_velocity_planner_common";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_behavior_velocity_planner_common";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ autoware-adapi-v1-msgs autoware-internal-debug-msgs autoware-internal-planning-msgs autoware-interpolation autoware-lanelet2-extension autoware-lanelet2-utils autoware-map-msgs autoware-motion-utils autoware-objects-of-interest-marker-interface autoware-perception-msgs autoware-planning-factor-interface autoware-planning-msgs autoware-route-handler autoware-trajectory autoware-utils-debug autoware-utils-geometry autoware-utils-rclcpp autoware-utils-system autoware-utils-visualization autoware-vehicle-info-utils autoware-velocity-smoother diagnostic-msgs geometry-msgs nav-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ autoware-adapi-v1-msgs autoware-internal-debug-msgs autoware-internal-planning-msgs autoware-interpolation autoware-lanelet2-extension autoware-lanelet2-utils autoware-map-msgs autoware-motion-utils autoware-objects-of-interest-marker-interface autoware-perception-msgs autoware-planning-factor-interface autoware-planning-msgs autoware-route-handler autoware-trajectory autoware-utils-debug autoware-utils-geometry autoware-utils-rclcpp autoware-utils-system autoware-utils-visualization autoware-vehicle-info-utils autoware-velocity-smoother diagnostic-msgs geometry-msgs nav-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common autoware-test-utils ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_behavior_velocity_planner_common" = substituteSource {
      src = fetchgit {
        name = "autoware_behavior_velocity_planner_common-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "6f61f496b4c75bb694de934379acab477039500c";
        hash = "sha256-7PybnHi4PVJuSCB7a6My4kS5c8Bpg0m4QlXzNMTiRi4=";
      };
    };
  });
  meta = {
    description = "The autoware_behavior_velocity_planner_common package";
  };
})
