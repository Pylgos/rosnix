{
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_ros,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_cmake_module,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    cv_bridge-0fa77b760b54eb36e8cf648b442d3a5636aeb0fc = substituteSource {
      src = fetchgit {
        name = "cv_bridge-0fa77b760b54eb36e8cf648b442d3a5636aeb0fc-source";
        url = "https://github.com/ros2-gbp/vision_opencv-release.git";
        rev = "0fa77b760b54eb36e8cf648b442d3a5636aeb0fc";
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
  src = sources.cv_bridge-0fa77b760b54eb36e8cf648b442d3a5636aeb0fc;
  nativeBuildInputs = [ ament_cmake_ros python_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python rclcpp rcpputils sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libboost-python" "libboost-python-dev" "libopencv-dev" "python3-numpy" "python3-opencv" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This contains CvBridge, which converts between ROS2 Image messages and OpenCV images.";
  };
}
