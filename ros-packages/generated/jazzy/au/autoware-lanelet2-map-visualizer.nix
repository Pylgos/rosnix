{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-lint-auto,
  autoware-cmake,
  autoware-lanelet2-extension,
  autoware-lanelet2-utils,
  autoware-lint-common,
  autoware-map-loader,
  autoware-map-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing-ament-cmake,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_lanelet2_map_visualizer";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_lanelet2_map_visualizer";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-lanelet2-extension autoware-lanelet2-utils autoware-map-msgs rclcpp rclcpp-components visualization-msgs ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-lanelet2-extension autoware-lanelet2-utils autoware-map-msgs rclcpp rclcpp-components visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto autoware-lint-common autoware-map-loader launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_lanelet2_map_visualizer" = substituteSource {
      src = fetchgit {
        name = "autoware_lanelet2_map_visualizer-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "7989c90570bea49598f371299b0bef7f7f7b7af9";
        hash = "sha256-I3dGoW66LJ8ppthBNcp4ApH8C9FoNuBfvfRJlfw5kWY=";
      };
    };
  });
  meta = {
    description = "The autoware_lanelet2_map_visualizer package";
  };
})
