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
  rosSystemPackages,
  sensor_msgs,
  std_srvs,
  stereo_msgs,
  substituteSource,
}:
let
  sources = rec {
    image_view-2049956d3bbfed4d14d56532559e32249c64a0d9 = substituteSource {
      src = fetchgit {
        name = "image_view-2049956d3bbfed4d14d56532559e32249c64a0d9-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "2049956d3bbfed4d14d56532559e32249c64a0d9";
        hash = "sha256-okCd9ccOwjYIEIp94aWGUAGzHKPoZhOonMVV5nVek7g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_view";
  version = "6.0.3-1";
  src = sources.image_view-2049956d3bbfed4d14d56532559e32249c64a0d9;
  nativeBuildInputs = [ ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ camera_calibration_parsers cv_bridge image_transport message_filters rclcpp rclcpp_components rclpy sensor_msgs std_srvs stereo_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A simple viewer for ROS image topics. Includes a specialized viewer for stereo + disparity images.";
  };
}
