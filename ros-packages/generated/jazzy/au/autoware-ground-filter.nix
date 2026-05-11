{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-index-cpp,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-point-types,
  autoware-utils-debug,
  autoware-utils-geometry,
  autoware-utils-math,
  autoware-utils-system,
  autoware-utils-tf,
  autoware-vehicle-info-utils,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message-filters,
  mkSourceSet,
  pcl-conversions,
  pcl-ros,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-ros,
  tf2-sensor-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_ground_filter";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_ground_filter";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp autoware-point-types autoware-utils-debug autoware-utils-geometry autoware-utils-math autoware-utils-system autoware-utils-tf autoware-vehicle-info-utils message-filters pcl-conversions pcl-ros rclcpp rclcpp-components sensor-msgs std-msgs tf2 tf2-eigen tf2-ros tf2-sensor-msgs ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ ament-index-cpp autoware-point-types autoware-utils-debug autoware-utils-geometry autoware-utils-math autoware-utils-system autoware-utils-tf autoware-vehicle-info-utils message-filters pcl-conversions pcl-ros rclcpp rclcpp-components sensor-msgs std-msgs tf2 tf2-eigen tf2-ros tf2-sensor-msgs ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_ground_filter" = substituteSource {
      src = fetchgit {
        name = "autoware_ground_filter-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "296aa70c86fb5288e68259eeb420a321efe2f30c";
        hash = "sha256-KsX+TZmeztBtMyc/oWrCdF4HvabRhOn9NrVEpcpZE8U=";
      };
    };
  });
  meta = {
    description = "The ROS 2 autoware_ground_filter package";
  };
})
