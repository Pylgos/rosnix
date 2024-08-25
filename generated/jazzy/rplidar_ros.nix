{
  ament_cmake_auto,
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    rplidar_ros = substituteSource {
      src = fetchgit {
        name = "rplidar_ros-source";
        url = "https://github.com/ros2-gbp/rplidar_ros-release.git";
        rev = "62ee07ff9d0bf9532bbdcdb1b8f0c22f8e7b25b8";
        hash = "sha256-lOiYrTggsDiQb9sCYtWAup4+kVoMnpSYqKqWGtnb2AU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rplidar_ros";
  version = "2.1.0-4";
  src = sources.rplidar_ros;
  nativeBuildInputs = [ ament_cmake_auto ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components sensor_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The rplidar ros package, support rplidar A2/A1 and A3/S1";
  };
}
