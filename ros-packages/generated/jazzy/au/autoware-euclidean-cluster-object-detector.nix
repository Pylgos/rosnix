{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-lint-auto,
  autoware-cmake,
  autoware-crop-box-filter,
  autoware-lint-common,
  autoware-perception-msgs,
  autoware-point-types,
  autoware-utils-debug,
  autoware-utils-diagnostics,
  autoware-utils-system,
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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_euclidean_cluster_object_detector";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_euclidean_cluster_object_detector";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-crop-box-filter autoware-perception-msgs autoware-point-types autoware-utils-debug autoware-utils-diagnostics autoware-utils-system geometry-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libpcl-all-dev" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-crop-box-filter autoware-perception-msgs autoware-point-types autoware-utils-debug autoware-utils-diagnostics autoware-utils-system geometry-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-all-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_euclidean_cluster_object_detector" = substituteSource {
      src = fetchgit {
        name = "autoware_euclidean_cluster_object_detector-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "85cfa1e721cf93044a6c9d877c0f373adb7f1ba7";
        hash = "sha256-81oc61yqufT5AFahTZ3Le461520yaD+JAMCxS0dpzGQ=";
      };
    };
  });
  meta = {
    description = "The autoware_euclidean_cluster_object_detector package";
  };
})
