{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  camera_info_manager,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  mkSourceSet,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "v4l2_camera" = substituteSource {
      src = fetchgit {
        name = "v4l2_camera-source";
        url = "https://github.com/ros2-gbp/ros2_v4l2_camera-release.git";
        rev = "e61c389ceb5ed83ae6b99ffd97f1b3dddb2a471e";
        hash = "sha256-OaSGrGK1Lj3ZocwVMqc8WO1+T6jU/Ky2u2UwIpRHqwY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "v4l2_camera";
  version = "0.7.1-1";
  src = sources."v4l2_camera";
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ camera_info_manager cv_bridge image_transport rclcpp rclcpp_components sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A ROS 2 camera driver using Video4Linux2";
  };
}
