{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  message_filters,
  pcl_msgs,
  rclcpp,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    pcl_conversions = substituteSource {
      src = fetchFromGitHub {
        name = "pcl_conversions-source";
        owner = "ros2-gbp";
        repo = "perception_pcl-release";
        rev = "99e9bfbb54bf30172e549adc7c50fd584dd21ece";
        hash = "sha256-JMlxHj6XMHqOVfS/n5Ir4meRb4o0pK3VoeE0GYS69FI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pcl_conversions";
  version = "2.6.1-3";
  src = sources.pcl_conversions;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ message_filters pcl_msgs rclcpp sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libpcl-all-dev" "libpcl-common" "libpcl-io" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides conversions from PCL data types and ROS message types";
  };
}
