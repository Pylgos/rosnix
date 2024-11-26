{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  camera-calibration-parsers,
  control-msgs,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometric-shapes,
  geometry-msgs,
  kdl-parser,
  launch,
  launch-ros,
  launch-testing,
  mkSourceSet,
  moveit-msgs,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-action,
  robot-calibration-msgs,
  rosSystemPackages,
  rosbag2-cpp,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
  tinyxml2-vendor,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "robot_calibration";
  version = "0.9.2-1";
  src = finalAttrs.passthru.sources."robot_calibration";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ camera-calibration-parsers control-msgs cv-bridge geometric-shapes geometry-msgs kdl-parser moveit-msgs nav-msgs pluginlib rclcpp rclcpp-action robot-calibration-msgs rosbag2-cpp sensor-msgs std-msgs tf2-geometry-msgs tf2-ros tinyxml2-vendor visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libboost-filesystem-dev" "libceres-dev" "libgflags-dev" "liborocos-kdl-dev" "protobuf-dev" "suitesparse" "tinyxml2" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gtest launch launch-ros launch-testing ];
  passthru = {
    sources = mkSourceSet (sources: {
      "robot_calibration" = substituteSource {
        src = fetchgit {
          name = "robot_calibration-source";
          url = "https://github.com/ros2-gbp/robot_calibration-release.git";
          rev = "7e9ad1e9eba3c24760d1da2d89b0c647d042b238";
          hash = "sha256-Wjdl+yT4g0dUIdUSrMGeweY3rJs8WDOsNliZ9xRBCvc=";
        };
      };
    });
  };
  meta = {
    description = "Calibrate a Robot";
  };
})
