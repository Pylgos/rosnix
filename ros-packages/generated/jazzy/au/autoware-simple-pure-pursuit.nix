{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-control-msgs,
  autoware-lint-common,
  autoware-motion-utils,
  autoware-planning-msgs,
  autoware-test-utils,
  autoware-utils-rclcpp,
  autoware-vehicle-info-utils,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_simple_pure_pursuit";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_simple_pure_pursuit";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-control-msgs autoware-motion-utils autoware-planning-msgs autoware-test-utils autoware-utils-rclcpp autoware-vehicle-info-utils rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-control-msgs autoware-motion-utils autoware-planning-msgs autoware-test-utils autoware-utils-rclcpp autoware-vehicle-info-utils rclcpp rclcpp-components ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_simple_pure_pursuit" = substituteSource {
      src = fetchgit {
        name = "autoware_simple_pure_pursuit-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "d5447fa6168591b6fb9ca789fdad8dd0c63a1529";
        hash = "sha256-myC1ND+wCHQslt6IGIKZbGOoDxP4O/GsryY/1CBGp9s=";
      };
    };
  });
  meta = {
    description = "The autoware_simple_pure_pursuit package";
  };
})
