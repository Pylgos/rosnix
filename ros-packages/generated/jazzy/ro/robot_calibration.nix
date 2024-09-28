{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  camera_calibration_parsers,
  control_msgs,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometric_shapes,
  geometry_msgs,
  kdl_parser,
  launch,
  launch_ros,
  launch_testing,
  mkSourceSet,
  moveit_msgs,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_action,
  robot_calibration_msgs,
  rosSystemPackages,
  rosbag2_cpp,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
  tinyxml2_vendor,
  visualization_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "robot_calibration" = substituteSource {
      src = fetchgit {
        name = "robot_calibration-source";
        url = "https://github.com/ros2-gbp/robot_calibration-release.git";
        rev = "c7df9f155f3a11ccc9927d183c64446c7d819267";
        hash = "sha256-fzPPa6NBKrV3U/XQPpUYuVK+ZY5efMVqnexTp429bBQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "robot_calibration";
  version = "0.9.1-1";
  src = sources."robot_calibration";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ camera_calibration_parsers control_msgs cv_bridge geometric_shapes geometry_msgs kdl_parser moveit_msgs nav_msgs pluginlib rclcpp rclcpp_action robot_calibration_msgs rosbag2_cpp sensor_msgs std_msgs tf2_geometry_msgs tf2_ros tinyxml2_vendor visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libboost-filesystem-dev" "libceres-dev" "libgflags-dev" "liborocos-kdl-dev" "protobuf-dev" "suitesparse" "tinyxml2" "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest launch launch_ros launch_testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Calibrate a Robot";
  };
}
