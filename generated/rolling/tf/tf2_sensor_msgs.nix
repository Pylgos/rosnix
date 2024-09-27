{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python_cmake_module,
  rclcpp,
  rosSystemPackages,
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
    tf2_sensor_msgs-e6adcf246f752a6f60a136d44250e14a385c3414 = substituteSource {
      src = fetchgit {
        name = "tf2_sensor_msgs-e6adcf246f752a6f60a136d44250e14a385c3414-source";
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
  src = sources.tf2_sensor_msgs-e6adcf246f752a6f60a136d44250e14a385c3414;
  nativeBuildInputs = [ ament_cmake python_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs sensor_msgs sensor_msgs_py std_msgs tf2 tf2_ros tf2_ros_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python3-numpy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Small lib to transform sensor_msgs with tf. Most notably, PointCloud2";
  };
}
