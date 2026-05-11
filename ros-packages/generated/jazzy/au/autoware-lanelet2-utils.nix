{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-index-cpp,
  autoware-cmake,
  autoware-lanelet2-extension,
  autoware-map-msgs,
  autoware-planning-msgs,
  autoware-pyplot,
  autoware-test-utils,
  autoware-utils-geometry,
  autoware-utils-math,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclpy-message-converter,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_lanelet2_utils";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_lanelet2_utils";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-lanelet2-extension autoware-map-msgs autoware-planning-msgs autoware-utils-geometry autoware-utils-math rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "range-v3" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-lanelet2-extension autoware-map-msgs autoware-planning-msgs autoware-utils-geometry autoware-utils-math rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "range-v3" ]; };
  checkInputs = [ ament-cmake-ros ament-index-cpp autoware-pyplot autoware-test-utils rclpy-message-converter ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  passthru.sources = mkSourceSet (sources: {
    "autoware_lanelet2_utils" = substituteSource {
      src = fetchgit {
        name = "autoware_lanelet2_utils-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "82c1781d57a67f3f49fcd3a481d61b98c87c1495";
        hash = "sha256-NEAWsH2EGDfSGeQj7Oa5zJEjyQvBS/5zoTdDN1ktY+A=";
      };
    };
  });
  meta = {
    description = "The autoware_lanelet2_utils package";
  };
})
