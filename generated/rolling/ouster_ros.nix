{
  ament_cmake,
  buildRosPackage,
  curl,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  gtest,
  jsoncpp,
  launch,
  launch_ros,
  ouster_sensor_msgs,
  pcl,
  pcl_conversions,
  pcl_ros,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  spdlog,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_eigen,
  tf2_ros,
}:
let
  sources = rec {
    ouster_ros = substituteSource {
      src = fetchgit {
        name = "ouster_ros-source";
        url = "https://github.com/ros2-gbp/ouster-ros-release.git";
        rev = "4c1bb0e902c3051d32a63320ce79cc5a55109263";
        hash = "sha256-Opx0mFprXiIgty9hc+lRjuMa4S82Wsjq0scFsO4oWbs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ouster_ros";
  version = "0.11.1-5";
  src = sources.ouster_ros;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [ curl ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs jsoncpp launch launch_ros ouster_sensor_msgs pcl pcl_conversions pcl_ros rclcpp rclcpp_components rclcpp_lifecycle rosidl_default_runtime sensor_msgs spdlog std_msgs std_srvs tf2_eigen tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ gtest ];
  missingDependencies = [ "libtins-dev" ];
  meta = {
    description = "Ouster ROS2 driver";
  };
}
