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
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-ros,
  tf2-ros-py,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "robot_state_publisher";
  version = "3.5.5-2";
  src = finalAttrs.passthru.sources."robot_state_publisher";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs kdl-parser rcl-interfaces rclcpp rclcpp-components sensor-msgs std-msgs tf2-ros urdf ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liborocos-kdl" "liborocos-kdl-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs kdl-parser rcl-interfaces rclcpp rclcpp-components sensor-msgs std-msgs tf2-ros urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liborocos-kdl" "liborocos-kdl-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common launch-ros launch-testing-ament-cmake tf2-ros-py ];
  passthru.sources = mkSourceSet (sources: {
    "robot_state_publisher" = substituteSource {
      src = fetchgit {
        name = "robot_state_publisher-source";
        url = "https://github.com/ros2-gbp/robot_state_publisher-release.git";
        rev = "f41e321335ff16e3e48bb15d8ff2d59ecfd4071f";
        hash = "sha256-OHmfkuI7eVgAff+WWWwr1k6Cvx8IFPESPMLZdT87kow=";
      };
    };
  });
  meta = {
    description = "\n    This package take the joint angles of a robot as input, and publishes the 3D poses of the robot links to tf2, using a kinematic tree model of the robot.\n  ";
  };
})
