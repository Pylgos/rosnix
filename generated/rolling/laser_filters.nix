{
  ament_cmake_auto,
  ament_cmake_gtest,
  angles,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  laser_geometry,
  message_filters,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    laser_filters = substituteSource {
      src = fetchgit {
        name = "laser_filters-source";
        url = "https://github.com/ros2-gbp/laser_filters-release.git";
        rev = "6ad8d2b8f63eb700eda85dc14dbd49cbf12e3c69";
        hash = "sha256-ruSsWz10XSElakzxzN1wQp+rS0CVAcaNHQpoVnP0f3k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "laser_filters";
  version = "2.0.7-2";
  src = sources.laser_filters;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles filters laser_geometry message_filters pluginlib rclcpp rclcpp_lifecycle sensor_msgs tf2 tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Assorted filters designed to operate on 2D planar laser scanners, which use the sensor_msgs/LaserScan type.";
  };
}
