{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-behavior-velocity-planner-common,
  autoware-cmake,
  autoware-internal-debug-msgs,
  autoware-internal-planning-msgs,
  autoware-lanelet2-extension,
  autoware-lint-common,
  autoware-motion-utils,
  autoware-object-recognition-utils,
  autoware-perception-msgs,
  autoware-planning-msgs,
  autoware-route-handler,
  autoware-utils-debug,
  autoware-utils-geometry,
  autoware-utils-math,
  autoware-utils-rclcpp,
  autoware-utils-visualization,
  autoware-velocity-smoother,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_motion_velocity_planner_common";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_motion_velocity_planner_common";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ autoware-behavior-velocity-planner-common autoware-internal-debug-msgs autoware-internal-planning-msgs autoware-lanelet2-extension autoware-motion-utils autoware-object-recognition-utils autoware-perception-msgs autoware-planning-msgs autoware-route-handler autoware-utils-debug autoware-utils-geometry autoware-utils-math autoware-utils-rclcpp autoware-utils-visualization autoware-velocity-smoother geometry-msgs rclcpp visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libboost-dev" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ autoware-behavior-velocity-planner-common autoware-internal-debug-msgs autoware-internal-planning-msgs autoware-lanelet2-extension autoware-motion-utils autoware-object-recognition-utils autoware-perception-msgs autoware-planning-msgs autoware-route-handler autoware-utils-debug autoware-utils-geometry autoware-utils-math autoware-utils-rclcpp autoware-utils-visualization autoware-velocity-smoother geometry-msgs rclcpp visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libboost-dev" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_motion_velocity_planner_common" = substituteSource {
      src = fetchgit {
        name = "autoware_motion_velocity_planner_common-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "532264d1cadba24475341c65a5241e4518e55fbe";
        hash = "sha256-yw7rO44N9n6bU3jesr9xqWZmaOfLSQgRcjuSv4bkD6E=";
      };
    };
  });
  meta = {
    description = "Common functions and interfaces for motion_velocity_planner modules";
  };
})
