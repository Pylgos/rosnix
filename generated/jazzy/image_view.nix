{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  camera_calibration_parsers,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  message_filters,
  rclcpp,
  rclcpp_components,
  rclpy,
  sensor_msgs,
  std_srvs,
  stereo_msgs,
  substituteSource,
}:
let
  sources = rec {
    image_view = substituteSource {
      src = fetchgit {
        name = "image_view-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "3421ca8f0da7cf0d33b8a11f27827498969623de";
        hash = "sha256-nlmUPk6L6CGxxVJmEPOE9f57Cttaq7ji5mWxsOAA1IY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_view";
  version = "5.0.4-1";
  src = sources.image_view;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_calibration_parsers cv_bridge image_transport message_filters rclcpp rclcpp_components rclpy sensor_msgs std_srvs stereo_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A simple viewer for ROS image topics. Includes a specialized viewer for stereo + disparity images.";
  };
}
