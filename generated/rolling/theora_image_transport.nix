{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  libogg,
  libtheora,
  pkg-config,
  pluginlib,
  rclcpp,
  rcutils,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    theora_image_transport = substituteSource {
      src = fetchgit {
        name = "theora_image_transport-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "26b238c28d321d6d2e05b50c5ddbd861115c5593";
        hash = "sha256-7xNmiPBIYxKO4RQ963R3iTS+v5tNAhXs/93YBMfB0rY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "theora_image_transport";
  version = "5.0.0-1";
  src = sources.theora_image_transport;
  nativeBuildInputs = [ ament_cmake pkg-config rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_transport libogg libtheora pluginlib rclcpp rcutils rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [ "libopencv-imgproc-dev" ];
  meta = {
    description = "Theora_image_transport provides a plugin to image_transport for transparently sending an image stream encoded with the Theora codec.";
  };
}
