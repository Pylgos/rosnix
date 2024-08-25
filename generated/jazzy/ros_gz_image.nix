{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_msgs_vendor,
  gz_transport_vendor,
  image_transport,
  pkg-config,
  rclcpp,
  ros_gz_bridge,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    ros_gz_image = substituteSource {
      src = fetchgit {
        name = "ros_gz_image-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "128a5d717e1b14f4c573c7136d00f831406fe3fb";
        hash = "sha256-XXRXhIebfDXbpwg7NMSLq+g+p4qDd5mV+SQ/woCMArg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_image";
  version = "1.0.3-1";
  src = sources.ros_gz_image;
  nativeBuildInputs = [ ament_cmake pkg-config ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_msgs_vendor gz_transport_vendor image_transport rclcpp ros_gz_bridge sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Image utilities for Gazebo simulation with ROS.";
  };
}
