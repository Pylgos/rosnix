{
  ament_cmake,
  ament_cmake_auto,
  buildRosPackage,
  camera_calibration,
  cv_bridge,
  depthai,
  depthai_bridge,
  depthai_descriptions,
  depthai_examples,
  depthai_ros_msgs,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg_image_transport_msgs,
  image_pipeline,
  image_transport,
  image_transport_plugins,
  pluginlib,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  vision_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    depthai_ros_driver-a0828a80e01b5655e6fe8d4cab0a9a8e0e9715d8 = substituteSource {
      src = fetchgit {
        name = "depthai_ros_driver-a0828a80e01b5655e6fe8d4cab0a9a8e0e9715d8-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "a0828a80e01b5655e6fe8d4cab0a9a8e0e9715d8";
        hash = "sha256-aKFRk+Jdj+oF2E8ruxI1mn2Oa3Q1OLJHP1C6ZwOMnKM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai_ros_driver";
  version = "2.10.1-1";
  src = sources.depthai_ros_driver-a0828a80e01b5655e6fe8d4cab0a9a8e0e9715d8;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ camera_calibration cv_bridge depthai depthai_bridge depthai_descriptions depthai_examples depthai_ros_msgs diagnostic_msgs diagnostic_updater ffmpeg_image_transport_msgs image_pipeline image_transport image_transport_plugins pluginlib rclcpp rclcpp_components sensor_msgs std_msgs std_srvs vision_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Depthai ROS Monolithic node.";
  };
}
