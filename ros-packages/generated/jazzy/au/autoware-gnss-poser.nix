{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-geography-utils,
  autoware-internal-debug-msgs,
  autoware-lint-common,
  autoware-map-msgs,
  autoware-sensing-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_gnss_poser";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_gnss_poser";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-geography-utils autoware-internal-debug-msgs autoware-map-msgs autoware-sensing-msgs geographic-msgs geometry-msgs rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "geographiclib" "libboost-dev" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-geography-utils autoware-internal-debug-msgs autoware-map-msgs autoware-sensing-msgs geographic-msgs geometry-msgs rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "geographiclib" "libboost-dev" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_gnss_poser" = substituteSource {
      src = fetchgit {
        name = "autoware_gnss_poser-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "a838c8510c38d25dceb5e2a9290098a881390ea8";
        hash = "sha256-ImZqWriY8Y4K5pdvp5iuhFnZ/et0Arsz183PWdLLIac=";
      };
    };
  });
  meta = {
    description = "The ROS 2 autoware_gnss_poser package";
  };
})
