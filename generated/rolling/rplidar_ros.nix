{
  ament_cmake_auto,
  ament_cmake_ros,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    rplidar_ros = substituteSource {
      src = fetchFromGitHub {
        name = "rplidar_ros-source";
        owner = "ros2-gbp";
        repo = "rplidar_ros-release";
        rev = "025ef3ae6b66638b31975b9eafce4f3cfbfa6dd6";
        hash = "sha256-lOiYrTggsDiQb9sCYtWAup4+kVoMnpSYqKqWGtnb2AU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rplidar_ros";
  version = "2.1.0-3";
  src = sources.rplidar_ros;
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
