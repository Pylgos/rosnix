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
  version = "3.9.3-1";
  src = finalAttrs.passthru.sources."robot_localization";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ angles builtin-interfaces diagnostic-msgs diagnostic-updater geographic-msgs geometry-msgs message-filters nav-msgs rclcpp rosidl-default-runtime sensor-msgs std-msgs std-srvs tf2 tf2-eigen tf2-geometry-msgs tf2-ros yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "geographiclib" "libboost-dev" ]; };
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ angles builtin-interfaces diagnostic-msgs diagnostic-updater geographic-msgs geometry-msgs message-filters nav-msgs rclcpp rosidl-default-runtime sensor-msgs std-msgs std-srvs tf2 tf2-eigen tf2-geometry-msgs tf2-ros yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "geographiclib" "libboost-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common launch-ros launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "robot_localization" = substituteSource {
      src = fetchgit {
        name = "robot_localization-source";
        url = "https://github.com/ros2-gbp/robot_localization-release.git";
        rev = "33373af525ad547af5751dee277df0e91570b3b1";
        hash = "sha256-OG1Wnk7h5bVsanocCxdtJY4bKHKavsqh6Pxs/PdXBHE=";
      };
    };
  });
  meta = {
    description = "Provides nonlinear state estimation through sensor fusion of an abritrary number of sensors.";
  };
})
