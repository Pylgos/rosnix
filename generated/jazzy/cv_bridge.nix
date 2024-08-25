{
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_ros,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  opencv,
  python3Packages,
  python_cmake_module,
  rclcpp,
  rcpputils,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    cv_bridge = substituteSource {
      src = fetchgit {
        name = "cv_bridge-source";
        url = "https://github.com/ros2-gbp/vision_opencv-release.git";
        rev = "d30ec40f8ebf943aaa16b860166e53a49a6f6174";
        hash = "sha256-2p4HVqVl4NRdIrRsJnGkfOapNAmOhKZN1R2KMmpxG/w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cv_bridge";
  version = "4.1.0-1";
  src = sources.cv_bridge;
  nativeBuildInputs = [ ament_cmake_ros python_cmake_module ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python opencv python3Packages.boost python3Packages.opencv4 rclcpp rcpputils sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "This contains CvBridge, which converts between ROS2 Image messages and OpenCV images.";
  };
}
