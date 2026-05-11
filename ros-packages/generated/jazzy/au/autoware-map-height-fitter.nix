{
  ament-cmake,
  ament-lint-auto,
  autoware-cmake,
  autoware-internal-localization-msgs,
  autoware-lanelet2-utils,
  autoware-lint-common,
  autoware-map-msgs,
  autoware-qos-utils,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  pcl-conversions,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_map_height_fitter";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_map_height_fitter";
  nativeBuildInputs = [ ament-cmake autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-internal-localization-msgs autoware-lanelet2-utils autoware-map-msgs autoware-qos-utils geometry-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libpcl-common" ]; };
  buildInputs = [ ament-cmake autoware-cmake ];
  propagatedBuildInputs = [ autoware-internal-localization-msgs autoware-lanelet2-utils autoware-map-msgs autoware-qos-utils geometry-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-common" ]; };
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_map_height_fitter" = substituteSource {
      src = fetchgit {
        name = "autoware_map_height_fitter-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "9ef1be90a43636f6191ed1de41fbaf8b96023f9a";
        hash = "sha256-3Z08pULjkWJPF7JdNVIBGTBTgoAfU7pm1r0m74dPxO4=";
      };
    };
  });
  meta = {
    description = "The autoware_map_height_fitter package";
  };
})
