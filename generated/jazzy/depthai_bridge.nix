{
  ament_cmake,
  ament_index_cpp,
  buildRosPackage,
  camera_info_manager,
  composition_interfaces,
  cv_bridge,
  depthai,
  depthai_ros_msgs,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg_image_transport_msgs,
  image_transport,
  rclcpp,
  robot_state_publisher,
  rosSystemPackages,
  ros_environment,
  sensor_msgs,
  std_msgs,
  stereo_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  vision_msgs,
  xacro,
}:
let
  sources = rec {
    depthai_bridge = substituteSource {
      src = fetchFromGitHub {
        name = "depthai_bridge-source";
        owner = "luxonis";
        repo = "depthai-ros-release";
        rev = "65d029c64cb020e7c5b21befa35cc5e5cc9d3ea8";
        hash = "sha256-vJCwbk1CU/g60IYPjbwR6HANtDHQx/IiQ3aHmQHmuRU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai_bridge";
  version = "2.10.0-1";
  src = sources.depthai_bridge;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp camera_info_manager composition_interfaces cv_bridge depthai depthai_ros_msgs ffmpeg_image_transport_msgs image_transport rclcpp robot_state_publisher sensor_msgs std_msgs stereo_msgs tf2 tf2_geometry_msgs tf2_ros vision_msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libopencv-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The depthai_bridge package";
  };
}
