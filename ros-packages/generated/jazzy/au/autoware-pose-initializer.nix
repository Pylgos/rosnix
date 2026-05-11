{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-gmock,
  ament-lint-auto,
  autoware-adapi-v1-msgs,
  autoware-cmake,
  autoware-component-interface-specs,
  autoware-lint-common,
  autoware-map-height-fitter,
  autoware-motion-utils,
  autoware-qos-utils,
  autoware-utils-diagnostics,
  autoware-utils-logging,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_pose_initializer";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_pose_initializer";
  nativeBuildInputs = [ ament-cmake autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-adapi-v1-msgs autoware-component-interface-specs autoware-map-height-fitter autoware-motion-utils autoware-qos-utils autoware-utils-diagnostics autoware-utils-logging geometry-msgs rclcpp rclcpp-components std-srvs ];
  buildInputs = [ ament-cmake autoware-cmake ];
  propagatedBuildInputs = [ autoware-adapi-v1-msgs autoware-component-interface-specs autoware-map-height-fitter autoware-motion-utils autoware-qos-utils autoware-utils-diagnostics autoware-utils-logging geometry-msgs rclcpp rclcpp-components std-srvs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gmock ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_pose_initializer" = substituteSource {
      src = fetchgit {
        name = "autoware_pose_initializer-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "98cd466d7594b6b9a978ff99a3e51a4f57500b22";
        hash = "sha256-f+ZEzCZ6X7dRQA0enUwxFe3UR/fgJpsfAOnR0kB3Z2c=";
      };
    };
  });
  meta = {
    description = "The autoware_pose_initializer package";
  };
})
