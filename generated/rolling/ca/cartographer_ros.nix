{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  cartographer,
  cartographer_ros_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  nav_msgs,
  pcl_conversions,
  rclcpp,
  robot_state_publisher,
  rosSystemPackages,
  ros_environment,
  rosbag2_cpp,
  rosbag2_storage,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_msgs,
  tf2_ros,
  urdf,
  visualization_msgs,
}:
let
  sources = rec {
    cartographer_ros = substituteSource {
      src = fetchgit {
        name = "cartographer_ros-source";
        url = "https://github.com/ros2-gbp/cartographer_ros-release.git";
        rev = "3d872cd7a18b999cdf018395efa737ad62005e46";
        hash = "sha256-VvGxCdcHPGbZC+Mp6BMa4qpdJ2eoz0PuoBvhe/6gtCE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cartographer_ros";
  version = "2.0.9003-1";
  src = sources.cartographer_ros;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "google-mock" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces cartographer cartographer_ros_msgs geometry_msgs launch nav_msgs pcl_conversions rclcpp robot_state_publisher rosbag2_cpp rosbag2_storage sensor_msgs std_msgs tf2 tf2_eigen tf2_msgs tf2_ros urdf visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libabsl-dev" "libgflags-dev" "libgoogle-glog-dev" "libpcl-all-dev" "python3-sphinx" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Cartographer is a system that provides real-time simultaneous localization and mapping (SLAM) in 2D and 3D across multiple platforms and sensor configurations. This package provides Cartographer's ROS integration.";
  };
}
