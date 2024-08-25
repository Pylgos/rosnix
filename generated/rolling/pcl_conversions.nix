{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  message_filters,
  pcl,
  pcl_msgs,
  rclcpp,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    pcl_conversions = substituteSource {
      src = fetchgit {
        name = "pcl_conversions-source";
        url = "https://github.com/ros2-gbp/perception_pcl-release.git";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen message_filters pcl pcl_msgs rclcpp sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ];
  missingDependencies = [ "libpcl-common" "libpcl-io" ];
  meta = {
    description = "Provides conversions from PCL data types and ROS message types";
  };
}
