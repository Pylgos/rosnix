{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-behavior-velocity-planner-common,
  autoware-cmake,
  autoware-internal-debug-msgs,
  autoware-internal-planning-msgs,
  autoware-lint-common,
  autoware-map-msgs,
  autoware-motion-utils,
  autoware-perception-msgs,
  autoware-planning-msgs,
  autoware-route-handler,
  autoware-trajectory,
  autoware-utils-debug,
  autoware-utils-logging,
  autoware-utils-pcl,
  autoware-utils-rclcpp,
  autoware-velocity-smoother,
  buildAmentCmakePackage,
  diagnostic-msgs,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  pcl-conversions,
  pluginlib,
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
  pname = "autoware_behavior_velocity_planner";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_behavior_velocity_planner";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ autoware-behavior-velocity-planner-common autoware-internal-debug-msgs autoware-internal-planning-msgs autoware-map-msgs autoware-motion-utils autoware-perception-msgs autoware-planning-msgs autoware-route-handler autoware-trajectory autoware-utils-debug autoware-utils-logging autoware-utils-pcl autoware-utils-rclcpp autoware-velocity-smoother diagnostic-msgs geometry-msgs pcl-conversions pluginlib rclcpp rclcpp-components sensor-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libboost-dev" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ autoware-behavior-velocity-planner-common autoware-internal-debug-msgs autoware-internal-planning-msgs autoware-map-msgs autoware-motion-utils autoware-perception-msgs autoware-planning-msgs autoware-route-handler autoware-trajectory autoware-utils-debug autoware-utils-logging autoware-utils-pcl autoware-utils-rclcpp autoware-velocity-smoother diagnostic-msgs geometry-msgs pcl-conversions pluginlib rclcpp rclcpp-components sensor-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libboost-dev" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_behavior_velocity_planner" = substituteSource {
      src = fetchgit {
        name = "autoware_behavior_velocity_planner-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "0cbbd8810cfb7600eba77439f4de69533a644efc";
        hash = "sha256-0feOA+B4rGSJYqn91jLZOKSQ0LULZNzNqDwdhnZpY8w=";
      };
    };
  });
  meta = {
    description = "The autoware_behavior_velocity_planner package";
  };
})
