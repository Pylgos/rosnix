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
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-eigen,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_crop_box_filter";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_crop_box_filter";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-point-types autoware-utils-debug autoware-utils-system autoware-utils-tf geometry-msgs rclcpp rclcpp-components sensor-msgs tf2-eigen ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-point-types autoware-utils-debug autoware-utils-system autoware-utils-tf geometry-msgs rclcpp rclcpp-components sensor-msgs tf2-eigen ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_crop_box_filter" = substituteSource {
      src = fetchgit {
        name = "autoware_crop_box_filter-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "3cb9a9b0b5c5e605eff7784622d03a9a18d8ffa6";
        hash = "sha256-QpX+eJTflcbjkvfIzH9JlKRCwbvxulBkW2dIOSlweXc=";
      };
    };
  });
  meta = {
    description = "The ROS 2 autoware_crop_box_filter package";
  };
})
