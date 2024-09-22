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
  fetchFromGitHub,
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
    depthai_ros_driver = substituteSource {
      src = fetchFromGitHub {
        name = "depthai_ros_driver-source";
        owner = "luxonis";
        repo = "depthai-ros-release";
        rev = "35e25b137570b1ac0e93cd9cb8cb38de6718ce9d";
        hash = "sha256-pFS6VN3MJbhD+CenQYF6o17ujHzFXws3v7VdSgm7rjc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai_ros_driver";
  version = "2.10.0-1";
  src = sources.depthai_ros_driver;
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
