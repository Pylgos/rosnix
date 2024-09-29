{
  ament_cmake_auto,
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rplidar_ros" = substituteSource {
      src = fetchgit {
        name = "rplidar_ros-source";
        url = "https://github.com/ros2-gbp/rplidar_ros-release.git";
        rev = "62ee07ff9d0bf9532bbdcdb1b8f0c22f8e7b25b8";
        hash = "sha256-lOiYrTggsDiQb9sCYtWAup4+kVoMnpSYqKqWGtnb2AU=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rplidar_ros";
  version = "2.1.0-4";
  src = sources."rplidar_ros";
  nativeBuildInputs = [ ament_cmake_auto ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp_components sensor_msgs std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The rplidar ros package, support rplidar A2/A1 and A3/S1";
  };
}