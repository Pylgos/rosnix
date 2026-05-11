{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-internal-planning-msgs,
  autoware-lanelet2-utils,
  autoware-lint-common,
  autoware-motion-utils,
  autoware-planning-msgs,
  autoware-planning-test-manager,
  autoware-test-utils,
  autoware-trajectory,
  autoware-utils-debug,
  autoware-utils-rclcpp,
  autoware-utils-system,
  autoware-vehicle-info-utils,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_path_generator";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_path_generator";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-internal-planning-msgs autoware-lanelet2-utils autoware-motion-utils autoware-planning-msgs autoware-planning-test-manager autoware-trajectory autoware-utils-debug autoware-utils-rclcpp autoware-utils-system autoware-vehicle-info-utils generate-parameter-library rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-internal-planning-msgs autoware-lanelet2-utils autoware-motion-utils autoware-planning-msgs autoware-planning-test-manager autoware-trajectory autoware-utils-debug autoware-utils-rclcpp autoware-utils-system autoware-vehicle-info-utils generate-parameter-library rclcpp rclcpp-components ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common autoware-test-utils ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_path_generator" = substituteSource {
      src = fetchgit {
        name = "autoware_path_generator-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "74b8a42c93fac57b9b0b258b3e8fd5db323b247a";
        hash = "sha256-zvt7awm6d554R2rilNpDbFv5ODygOtaAUufY8m1rXdc=";
      };
    };
  });
  meta = {
    description = "The autoware_path_generator package";
  };
})
