{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_filters";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."leo_filters";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ generate-parameter-library geometry-msgs nav-msgs rclcpp rclcpp-components sensor-msgs std-srvs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ generate-parameter-library geometry-msgs nav-msgs rclcpp rclcpp-components sensor-msgs std-srvs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_filters" = substituteSource {
      src = fetchgit {
        name = "leo_filters-source";
        url = "https://github.com/ros2-gbp/leo_robot-release.git";
        rev = "c30c956aeb4cfd4ca2299bb57dbbb433df30424d";
        hash = "sha256-QbfMStMGFdyKgJqlrPAzjfv8JQD4zWhbone2YNrCW6k=";
      };
    };
  });
  meta = {
    description = "Nodes for filtering and processing imu and wheel odom messages.";
  };
})
