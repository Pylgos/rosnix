{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  camera_info_manager,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  substituteSource,
}:
let
  sources = rec {
    image_publisher = substituteSource {
      src = fetchgit {
        name = "image_publisher-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "c5ab135c721c8e346e2dcd86779e4644740f4800";
        hash = "sha256-tD37S9/S1T4y3f7AKODt5zsCgYCCERxOZ6Q4AfqNNO0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_publisher";
  version = "6.0.3-1";
  src = sources.image_publisher;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_info_manager cv_bridge image_transport rcl_interfaces rclcpp rclcpp_components ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Contains a node publish an image stream from single image file or avi motion file.";
  };
}
