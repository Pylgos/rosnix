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
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
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
        rev = "f8767d98e14ecadb0040f7ee603721db2b1c8e6a";
        hash = "sha256-iXzePoqM7vsVgt2Y9h3m2scZ7J8qfIkJ31crq9I/j9s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depth_image_proc";
  version = "6.0.3-1";
  src = sources.depth_image_proc;
  nativeBuildInputs = [ ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ class_loader cv_bridge image_geometry image_proc image_transport message_filters rclcpp rclcpp_components sensor_msgs stereo_msgs tf2 tf2_eigen tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Contains components for processing depth images such as those produced by OpenNI camera. Functions include creating disparity images and point clouds, as well as registering (reprojecting) a depth image into another camera frame.";
  };
}
