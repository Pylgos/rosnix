{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  builtin-interfaces,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  launch-ros,
  launch-testing-ament-cmake,
  message-filters,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rmw-implementation,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-ros,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "robot_localization";
  version = "3.8.1-1";
  src = finalAttrs.passthru.sources."robot_localization";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  buildInputs = [ builtin-interfaces ];
  propagatedBuildInputs = [ angles diagnostic-msgs diagnostic-updater geographic-msgs geometry-msgs message-filters nav-msgs rclcpp rmw-implementation rosidl-default-runtime sensor-msgs std-msgs std-srvs tf2 tf2-eigen tf2-geometry-msgs tf2-ros yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "geographiclib" "libboost-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common builtin-interfaces launch-ros launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "robot_localization" = substituteSource {
      src = fetchgit {
        name = "robot_localization-source";
        url = "https://github.com/ros2-gbp/robot_localization-release.git";
        rev = "baea1cdab65a10e0a56964ca9098bd3362cf75da";
        hash = "sha256-fZ43sEzp1RU9bYJqKBy8b3t+X6i8tNx05QFMlplxxys=";
      };
    };
  });
  meta = {
    description = "Provides nonlinear state estimation through sensor fusion of an abritrary number of sensors.";
  };
})
