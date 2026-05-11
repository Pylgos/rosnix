{
  ament-cmake-auto,
  ament-cmake-cppcheck,
  ament-index-cpp,
  ament-lint-auto,
  autoware-agnocast-wrapper,
  autoware-cmake,
  autoware-internal-debug-msgs,
  autoware-internal-localization-msgs,
  autoware-localization-util,
  autoware-map-msgs,
  autoware-qos-utils,
  autoware-utils-diagnostics,
  autoware-utils-logging,
  autoware-utils-pcl,
  autoware-utils-visualization,
  buildAmentCmakePackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch-testing-ament-cmake,
  mkSourceSet,
  nav-msgs,
  pcl-conversions,
  rclcpp,
  rclcpp-components,
  ros-testing,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-ros,
  tf2-sensor-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_ndt_scan_matcher";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_ndt_scan_matcher";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-agnocast-wrapper autoware-internal-debug-msgs autoware-internal-localization-msgs autoware-localization-util autoware-map-msgs autoware-qos-utils autoware-utils-diagnostics autoware-utils-logging autoware-utils-pcl autoware-utils-visualization diagnostic-msgs geometry-msgs nav-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs std-srvs tf2 tf2-eigen tf2-geometry-msgs tf2-ros tf2-sensor-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "libpcl-all" "libpcl-all-dev" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-agnocast-wrapper autoware-internal-debug-msgs autoware-internal-localization-msgs autoware-localization-util autoware-map-msgs autoware-qos-utils autoware-utils-diagnostics autoware-utils-logging autoware-utils-pcl autoware-utils-visualization diagnostic-msgs geometry-msgs nav-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs std-srvs tf2 tf2-eigen tf2-geometry-msgs tf2-ros tf2-sensor-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "libpcl-all" "libpcl-all-dev" ]; };
  checkInputs = [ ament-cmake-cppcheck ament-index-cpp ament-lint-auto launch-testing-ament-cmake ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_ndt_scan_matcher" = substituteSource {
      src = fetchgit {
        name = "autoware_ndt_scan_matcher-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "0657a2156d163c0c950a628c5cbdbe2b341f95e6";
        hash = "sha256-bflErKHGzKgKNeWBmVHjd6Z+Zec04AjKJ58ITC4L/jk=";
      };
    };
  });
  meta = {
    description = "The autoware_ndt_scan_matcher package";
  };
})
