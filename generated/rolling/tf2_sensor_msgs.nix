{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python3Packages,
  python_cmake_module,
  rclcpp,
  sensor_msgs,
  sensor_msgs_py,
  std_msgs,
  substituteSource,
  tf2,
  tf2_ros,
  tf2_ros_py,
}:
let
  sources = rec {
    tf2_sensor_msgs = substituteSource {
      src = fetchgit {
        name = "tf2_sensor_msgs-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "e6adcf246f752a6f60a136d44250e14a385c3414";
        hash = "sha256-5XPGyzDdC32g214iADAejuOE9Ocu3TW7tjmoRfDcbFo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_sensor_msgs";
  version = "0.38.2-1";
  src = sources.tf2_sensor_msgs;
  nativeBuildInputs = [ ament_cmake python_cmake_module ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs python3Packages.numpy sensor_msgs sensor_msgs_py std_msgs tf2 tf2_ros tf2_ros_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common rclcpp ];
  missingDependencies = [  ];
  meta = {
    description = "Small lib to transform sensor_msgs with tf. Most notably, PointCloud2";
  };
}
