{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  buildRosPackage,
  builtin_interfaces,
  cv_bridge,
  diagnostic_updater,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  image_transport,
  launch_pytest,
  launch_ros,
  launch_testing,
  librealsense2,
  nav_msgs,
  python3Packages,
  rclcpp,
  rclcpp_components,
  realsense2_camera_msgs,
  ros2topic,
  ros_environment,
  sensor_msgs,
  sensor_msgs_py,
  std_msgs,
  substituteSource,
  tf2,
  tf2_ros,
  tf2_ros_py,
}:
let
  sources = rec {
    realsense2_camera = substituteSource {
      src = fetchgit {
        name = "realsense2_camera-source";
        url = "https://github.com/IntelRealSense/realsense-ros-release.git";
        rev = "7acfab07cc185dbc1feb9a98c38c77a81d45f558";
        hash = "sha256-HLMJvHtjNkhBqaTH95BraW0/xbrTUIcDdAE/18aDBWw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "realsense2_camera";
  version = "4.55.1-3";
  src = sources.realsense2_camera;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces cv_bridge diagnostic_updater eigen geometry_msgs image_transport launch_ros librealsense2 nav_msgs rclcpp rclcpp_components realsense2_camera_msgs sensor_msgs std_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest launch_pytest launch_testing python3Packages.numpy python3Packages.requests python3Packages.tqdm ros2topic sensor_msgs_py tf2_ros_py ];
  missingDependencies = [  ];
  meta = {
    description = "RealSense camera package allowing access to Intel D400 3D cameras";
  };
}
