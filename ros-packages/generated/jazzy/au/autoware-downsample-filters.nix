{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-point-types,
  autoware-utils-debug,
  autoware-utils-system,
  autoware-utils-tf,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pcl-conversions,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_downsample_filters";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_downsample_filters";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-point-types autoware-utils-debug autoware-utils-system autoware-utils-tf pcl-conversions rclcpp sensor-msgs ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-point-types autoware-utils-debug autoware-utils-system autoware-utils-tf pcl-conversions rclcpp sensor-msgs ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_downsample_filters" = substituteSource {
      src = fetchgit {
        name = "autoware_downsample_filters-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "3c6b6b0d306186bef563a26620d61c42b5df0849";
        hash = "sha256-70YLqDL2LEaBoiKAQDiLDk0BMRuSoUiJL60suv3Zykg=";
      };
    };
  });
  meta = {
    description = "The ROS 2 autoware_downsample_filters package";
  };
})
