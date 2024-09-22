{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  launch_ros,
  ouster_sensor_msgs,
  pcl_conversions,
  pcl_ros,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_eigen,
  tf2_ros,
}:
let
  sources = rec {
    ouster_ros = substituteSource {
      src = fetchFromGitHub {
        name = "ouster_ros-source";
        owner = "ros2-gbp";
        repo = "ouster-ros-release";
        rev = "3dd5ba0f91e8c8a4126e676e4729b34cd5faa8c0";
        hash = "sha256-Opx0mFprXiIgty9hc+lRjuMa4S82Wsjq0scFsO4oWbs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ouster_ros";
  version = "0.11.1-6";
  src = sources.ouster_ros;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs launch launch_ros ouster_sensor_msgs pcl_conversions pcl_ros rclcpp rclcpp_components rclcpp_lifecycle rosidl_default_runtime sensor_msgs std_msgs std_srvs tf2_eigen tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libjsoncpp" "libjsoncpp-dev" "libpcl-all-dev" "libtins-dev" "spdlog" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  meta = {
    description = "Ouster ROS2 driver";
  };
}
