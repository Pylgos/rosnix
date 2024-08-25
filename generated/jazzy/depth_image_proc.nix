{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  class_loader,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_geometry,
  image_proc,
  image_transport,
  message_filters,
  opencv,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  stereo_msgs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_ros,
}:
let
  sources = rec {
    depth_image_proc = substituteSource {
      src = fetchgit {
        name = "depth_image_proc-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "199ab5962f4bf9363ab0b37820ee5fceb91a0d60";
        hash = "sha256-H0Jxs7d2nXmrS94RT2Nz3xfc2OobnX8nCgBnQKQMQR4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depth_image_proc";
  version = "5.0.4-1";
  src = sources.depth_image_proc;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader cv_bridge image_geometry image_proc image_transport message_filters opencv rclcpp rclcpp_components sensor_msgs stereo_msgs tf2 tf2_eigen tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Contains components for processing depth images such as those produced by OpenNI camera. Functions include creating disparity images and point clouds, as well as registering (reprojecting) a depth image into another camera frame.";
  };
}
