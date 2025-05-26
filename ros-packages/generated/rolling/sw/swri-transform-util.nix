{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-python,
  ament-index-cpp,
  buildAmentCmakePackage,
  cv-bridge,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  gps-msgs,
  launch-ros,
  launch-testing,
  launch-testing-ament-cmake,
  marti-nav-msgs,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  swri-math-util,
  swri-roscpp,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "swri_transform_util";
  version = "3.7.5-1";
  src = finalAttrs.passthru.sources."swri_transform_util";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ cv-bridge diagnostic-msgs diagnostic-updater geographic-msgs geometry-msgs gps-msgs marti-nav-msgs rcl-interfaces rclcpp rclcpp-components rclpy sensor-msgs swri-math-util swri-roscpp tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "geographiclib" "geos" "proj" "python3-numpy" "python3-yaml" "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ cv-bridge diagnostic-msgs diagnostic-updater geographic-msgs geometry-msgs gps-msgs marti-nav-msgs rcl-interfaces rclcpp rclcpp-components rclpy sensor-msgs swri-math-util swri-roscpp tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "geographiclib" "geos" "proj" "python3-numpy" "python3-yaml" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gtest ament-index-cpp launch-ros launch-testing launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "swri_transform_util" = substituteSource {
      src = fetchgit {
        name = "swri_transform_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "540ad36cb5bd342ac3b24d8a50d29831b1c0325c";
        hash = "sha256-xIn8ygWP5KejEUoeKwxOebqW8+v/zFpPPqk98mAH1J8=";
      };
    };
  });
  meta = {
    description = "\n\n     The swri_transform_util package contains utility functions and classes for\n     transforming between coordinate frames.\n\n  ";
  };
})
