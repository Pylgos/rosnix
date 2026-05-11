{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-internal-debug-msgs,
  autoware-internal-planning-msgs,
  autoware-lint-common,
  autoware-map-msgs,
  autoware-motion-utils,
  autoware-motion-velocity-planner-common,
  autoware-perception-msgs,
  autoware-planning-factor-interface,
  autoware-planning-msgs,
  autoware-test-utils,
  autoware-utils-debug,
  autoware-utils-geometry,
  autoware-utils-logging,
  autoware-utils-pcl,
  autoware-utils-rclcpp,
  autoware-utils-system,
  autoware-velocity-smoother,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  grid-map-core,
  mkSourceSet,
  pcl-conversions,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_motion_velocity_planner";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_motion_velocity_planner";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ autoware-internal-debug-msgs autoware-internal-planning-msgs autoware-map-msgs autoware-motion-utils autoware-motion-velocity-planner-common autoware-perception-msgs autoware-planning-factor-interface autoware-planning-msgs autoware-utils-debug autoware-utils-geometry autoware-utils-logging autoware-utils-pcl autoware-utils-rclcpp autoware-utils-system autoware-velocity-smoother geometry-msgs grid-map-core pcl-conversions pluginlib rclcpp rclcpp-components rosidl-default-generators rosidl-default-runtime sensor-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libboost-dev" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ autoware-internal-debug-msgs autoware-internal-planning-msgs autoware-map-msgs autoware-motion-utils autoware-motion-velocity-planner-common autoware-perception-msgs autoware-planning-factor-interface autoware-planning-msgs autoware-utils-debug autoware-utils-geometry autoware-utils-logging autoware-utils-pcl autoware-utils-rclcpp autoware-utils-system autoware-velocity-smoother geometry-msgs grid-map-core pcl-conversions pluginlib rclcpp rclcpp-components rosidl-default-generators rosidl-default-runtime sensor-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libboost-dev" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common autoware-test-utils ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_motion_velocity_planner" = substituteSource {
      src = fetchgit {
        name = "autoware_motion_velocity_planner-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "a6f5c83234ec55ccbf0bfa5916c218def58db05c";
        hash = "sha256-XILQOvUJC/gX962DVAdOqTQoKXQ3K1jy62nsQLYypvY=";
      };
    };
  });
  meta = {
    description = "Node of the motion_velocity_planner";
  };
})
