{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  message_filters,
  rclcpp,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    imu_complementary_filter = substituteSource {
      src = fetchgit {
        name = "imu_complementary_filter-source";
        url = "https://github.com/ros2-gbp/imu_tools-release.git";
        rev = "e14b791b4d7933504d13ecb0cb24587b78688f31";
        hash = "sha256-wuAsf255PYh35JCpP4czKRL9rKu2pxO/i4NOMSETePc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "imu_complementary_filter";
  version = "2.1.3-4";
  src = sources.imu_complementary_filter;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs message_filters rclcpp sensor_msgs std_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Filter which fuses angular velocities, accelerations, and (optionally) magnetic readings from a generic IMU device into a quaternion to represent the orientation of the device wrt the global frame. Based on the algorithm by Roberto G. Valenti etal. described in the paper \"Keeping a Good Attitude: A Quaternion-Based Orientation Filter for IMUs and MARGs\" available at http://www.mdpi.com/1424-8220/15/8/19302 .";
  };
}
