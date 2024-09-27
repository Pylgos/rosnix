{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  buildRosPackage,
  builtin_interfaces,
  cv_bridge,
  diagnostic_updater,
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
  rclcpp,
  rclcpp_components,
  realsense2_camera_msgs,
  ros2topic,
  rosSystemPackages,
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
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces cv_bridge diagnostic_updater geometry_msgs image_transport launch_ros librealsense2 nav_msgs rclcpp rclcpp_components realsense2_camera_msgs sensor_msgs std_msgs tf2 tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest launch_pytest launch_testing ros2topic sensor_msgs_py tf2_ros_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-requests" "python3-tqdm" ]; };
  meta = {
    description = "RealSense camera package allowing access to Intel D400 3D cameras";
  };
}
