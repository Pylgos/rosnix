{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_clang_format,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  apriltag,
  apriltag_msgs,
  buildRosPackage,
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
    apriltag_detector = substituteSource {
      src = fetchgit {
        name = "apriltag_detector-source";
        url = "https://github.com/ros2-gbp/apriltag_detector-release.git";
        rev = "4793979b66ea90f82cabfea99db22a25a732e435";
        hash = "sha256-jOHnmzOSEBudRKyE4FGX5VDw7JIfjVJ2gcmiwcNz4jQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag_detector";
  version = "1.0.0-3";
  src = sources.apriltag_detector;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ apriltag apriltag_msgs cv_bridge image_transport rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_clang_format ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ROS package for apriltag detection";
  };
}
