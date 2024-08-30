{
  ament_cmake,
  ament_index_cpp,
  buildRosPackage,
  camera_info_manager,
  composition_interfaces,
  cv_bridge,
  depthai,
  depthai_ros_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg_image_transport_msgs,
  image_transport,
  opencv,
  python3Packages,
  rclcpp,
  robot_state_publisher,
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
      src = fetchgit {
        name = "depthai_bridge-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp camera_info_manager composition_interfaces cv_bridge depthai depthai_ros_msgs ffmpeg_image_transport_msgs image_transport opencv python3Packages.boost rclcpp robot_state_publisher sensor_msgs std_msgs stereo_msgs tf2 tf2_geometry_msgs tf2_ros vision_msgs xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The depthai_bridge package";
  };
}
