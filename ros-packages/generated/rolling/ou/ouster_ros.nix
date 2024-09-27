{
  ament_cmake,
  buildRosPackage,
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
    ouster_ros-4c1bb0e902c3051d32a63320ce79cc5a55109263 = substituteSource {
      src = fetchgit {
        name = "ouster_ros-4c1bb0e902c3051d32a63320ce79cc5a55109263-source";
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
  src = sources.ouster_ros-4c1bb0e902c3051d32a63320ce79cc5a55109263;
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
