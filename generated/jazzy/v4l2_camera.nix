{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  camera_info_manager,
  cv_bridge,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    v4l2_camera = substituteSource {
      src = fetchFromGitHub {
        name = "v4l2_camera-source";
        owner = "ros2-gbp";
        repo = "ros2_v4l2_camera-release";
        rev = "ad3d1855e15fb303b725cb6522470ac178b88cb7";
        hash = "sha256-OaSGrGK1Lj3ZocwVMqc8WO1+T6jU/Ky2u2UwIpRHqwY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "v4l2_camera";
  version = "0.7.1-1";
  src = sources.v4l2_camera;
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
