{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-adapi-v1-msgs,
  autoware-cmake,
  autoware-component-interface-specs,
  autoware-internal-debug-msgs,
  autoware-lanelet2-utils,
  autoware-lint-common,
  autoware-map-msgs,
  autoware-motion-utils,
  autoware-planning-msgs,
  autoware-route-handler,
  autoware-test-utils,
  autoware-utils-geometry,
  autoware-utils-logging,
  autoware-utils-math,
  autoware-utils-system,
  autoware-utils-visualization,
  autoware-vehicle-info-utils,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_mission_planner";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_mission_planner";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-adapi-v1-msgs autoware-component-interface-specs autoware-internal-debug-msgs autoware-lanelet2-utils autoware-map-msgs autoware-motion-utils autoware-planning-msgs autoware-route-handler autoware-utils-geometry autoware-utils-logging autoware-utils-math autoware-utils-system autoware-utils-visualization autoware-vehicle-info-utils geometry-msgs pluginlib rclcpp rclcpp-components tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-adapi-v1-msgs autoware-component-interface-specs autoware-internal-debug-msgs autoware-lanelet2-utils autoware-map-msgs autoware-motion-utils autoware-planning-msgs autoware-route-handler autoware-utils-geometry autoware-utils-logging autoware-utils-math autoware-utils-system autoware-utils-visualization autoware-vehicle-info-utils geometry-msgs pluginlib rclcpp rclcpp-components tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common autoware-test-utils ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_mission_planner" = substituteSource {
      src = fetchgit {
        name = "autoware_mission_planner-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "e7482ecac63bf39b1d05a11a93ae5d7dcbee2fb9";
        hash = "sha256-2jpNSJZ24a8ofMSTIKUYjzt3S4go1Sk3hIy5ED/LiAI=";
      };
    };
  });
  meta = {
    description = "The autoware_mission_planner package";
  };
})
