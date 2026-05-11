{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-internal-debug-msgs,
  autoware-internal-planning-msgs,
  autoware-interpolation,
  autoware-lint-common,
  autoware-motion-utils,
  autoware-osqp-interface,
  autoware-planning-msgs,
  autoware-planning-test-manager,
  autoware-qp-interface,
  autoware-trajectory,
  autoware-utils-debug,
  autoware-utils-diagnostics,
  autoware-utils-geometry,
  autoware-utils-logging,
  autoware-utils-math,
  autoware-utils-rclcpp,
  autoware-vehicle-info-utils,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_velocity_smoother";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_velocity_smoother";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ autoware-internal-debug-msgs autoware-internal-planning-msgs autoware-interpolation autoware-motion-utils autoware-osqp-interface autoware-planning-msgs autoware-planning-test-manager autoware-qp-interface autoware-trajectory autoware-utils-debug autoware-utils-diagnostics autoware-utils-geometry autoware-utils-logging autoware-utils-math autoware-utils-rclcpp autoware-vehicle-info-utils geometry-msgs nav-msgs rclcpp tf2 tf2-ros ];
  buildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ autoware-internal-debug-msgs autoware-internal-planning-msgs autoware-interpolation autoware-motion-utils autoware-osqp-interface autoware-planning-msgs autoware-planning-test-manager autoware-qp-interface autoware-trajectory autoware-utils-debug autoware-utils-diagnostics autoware-utils-geometry autoware-utils-logging autoware-utils-math autoware-utils-rclcpp autoware-vehicle-info-utils geometry-msgs nav-msgs rclcpp tf2 tf2-ros ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_velocity_smoother" = substituteSource {
      src = fetchgit {
        name = "autoware_velocity_smoother-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "d865e0fcd17a002c8fb6e6fc0b3377db11595dd7";
        hash = "sha256-PHfLATZjcrkcplilgoeweceBeeDWLlrNJ5+MpB7XjMo=";
      };
    };
  });
  meta = {
    description = "The autoware_velocity_smoother package";
  };
})
