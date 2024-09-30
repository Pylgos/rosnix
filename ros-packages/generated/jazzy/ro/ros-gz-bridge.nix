{
  actuator-msgs,
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  gps-msgs,
  gz-msgs-vendor,
  gz-transport-vendor,
  launch-ros,
  launch-testing,
  launch-testing-ament-cmake,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  ros-gz-interfaces,
  rosSystemPackages,
  rosgraph-msgs,
  rosidl-pycommon,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-msgs,
  trajectory-msgs,
  vision-msgs,
  yaml-cpp-vendor,
}:
let
  sources = mkSourceSet (sources: {
    "ros_gz_bridge" = substituteSource {
      src = fetchgit {
        name = "ros_gz_bridge-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "909e4c0027ba0e9b77bb88454cf7b1cc226ac44b";
        hash = "sha256-6B+4M6koKUT8OalF9gUaaACfJbtnSKnerqeTcUBEOcs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ros_gz_bridge";
  version = "1.0.4-1";
  src = sources."ros_gz_bridge";
  nativeBuildInputs = [ ament-cmake rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ actuator-msgs geometry-msgs gps-msgs gz-msgs-vendor gz-transport-vendor nav-msgs rclcpp rclcpp-components ros-gz-interfaces rosgraph-msgs sensor-msgs std-msgs tf2-msgs trajectory-msgs vision-msgs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common launch-ros launch-testing launch-testing-ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Bridge communication between ROS and Gazebo Transport";
  };
}
