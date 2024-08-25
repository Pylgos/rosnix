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
        rev = "ff716c4d7046994ca7c71db362ba4a91a543b344";
        hash = "sha256-AsQQc8vOg8HlYZO2vq16sr/glUJyQVZc33W/6SMQMJ0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_image";
  version = "2.0.0-1";
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
