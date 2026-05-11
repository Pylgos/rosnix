{
  ament-cmake-auto,
  ament-cmake-gmock,
  ament-lint-auto,
  autoware-cmake,
  autoware-component-interface-specs,
  autoware-geography-utils,
  autoware-lanelet2-extension,
  autoware-lanelet2-utils,
  autoware-lint-common,
  autoware-map-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch-testing-ament-cmake,
  mkSourceSet,
  pcl-conversions,
  rclcpp,
  rclcpp-components,
  ros-testing,
  rosSystemPackages,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_map_loader";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_map_loader";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-component-interface-specs autoware-geography-utils autoware-lanelet2-extension autoware-lanelet2-utils autoware-map-msgs geometry-msgs pcl-conversions rclcpp rclcpp-components visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "libpcl-all-dev" "yaml-cpp" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-component-interface-specs autoware-geography-utils autoware-lanelet2-extension autoware-lanelet2-utils autoware-map-msgs geometry-msgs pcl-conversions rclcpp rclcpp-components visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "libpcl-all-dev" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gmock ament-lint-auto autoware-lint-common launch-testing-ament-cmake ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_map_loader" = substituteSource {
      src = fetchgit {
        name = "autoware_map_loader-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "dfe3345e2d183ad28d978bea40a5a0a8fa350467";
        hash = "sha256-RDBtjfviv/RscKZYIpvfC7Y51ZwiP0h+q3zFgGzJM0I=";
      };
    };
  });
  meta = {
    description = "The autoware_map_loader package";
  };
})
