{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  motion_capture_tracking_interfaces,
  pcl,
  rclcpp,
  sensor_msgs,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    motion_capture_tracking = substituteSource {
      src = fetchgit {
        name = "motion_capture_tracking-source";
        url = "https://github.com/ros2-gbp/motion_capture_tracking-release.git";
        rev = "42bccb83df2d4181678a85d158baf5f9a996a3fe";
        hash = "sha256-i4x1fFnItmyr13Kz2YfUYfYKcessV15UqBvrOb4Q41c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "motion_capture_tracking";
  version = "1.0.3-3";
  src = sources.motion_capture_tracking;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ eigen eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ motion_capture_tracking_interfaces pcl rclcpp sensor_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ROS Package for different motion capture systems, including custom rigid body tracking support";
  };
}
