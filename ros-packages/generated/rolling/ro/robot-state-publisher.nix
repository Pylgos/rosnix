{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  kdl-parser,
  launch-ros,
  launch-testing-ament-cmake,
  mkSourceSet,
  orocos-kdl-vendor,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-ros,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "robot_state_publisher";
  version = "3.5.2-1";
  src = finalAttrs.passthru.sources."robot_state_publisher";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs kdl-parser orocos-kdl-vendor rcl-interfaces rclcpp rclcpp-components sensor-msgs std-msgs tf2-ros urdf ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs kdl-parser orocos-kdl-vendor rcl-interfaces rclcpp rclcpp-components sensor-msgs std-msgs tf2-ros urdf ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common launch-ros launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "robot_state_publisher" = substituteSource {
      src = fetchgit {
        name = "robot_state_publisher-source";
        url = "https://github.com/ros2-gbp/robot_state_publisher-release.git";
        rev = "7bbf5f73e0caea1df22ce28f033d50b673d5bd64";
        hash = "sha256-V2pK9ISipod3q4LxlLxuqrCbW4nz72AeMVCtFG8AG/w=";
      };
    };
  });
  meta = {
    description = "\n    This package take the joint angles of a robot as input, and publishes the 3D poses of the robot links to tf2, using a kinematic tree model of the robot.\n  ";
  };
})
