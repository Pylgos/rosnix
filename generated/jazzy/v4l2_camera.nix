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
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    v4l2_camera = substituteSource {
      src = fetchgit {
        name = "v4l2_camera-source";
        url = "https://github.com/ros2-gbp/ros2_v4l2_camera-release.git";
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
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_info_manager cv_bridge image_transport rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A ROS 2 camera driver using Video4Linux2";
  };
}
