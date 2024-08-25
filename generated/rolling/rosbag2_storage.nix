{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  rclcpp,
  rcutils,
  rmw,
  rosbag2_test_common,
  substituteSource,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    rosbag2_storage = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "d54163257b4623ff42170bbe09d97f839bd872c2";
        hash = "sha256-/g3qjdaBK1wCdX4Y/MYCryEMREEnkdzMyx9BjLeP5Os=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_storage";
  version = "0.28.0-1";
  src = sources.rosbag2_storage;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib rclcpp rcutils rmw yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_lint_auto ament_lint_common rosbag2_test_common ];
  missingDependencies = [  ];
  meta = {
    description = "ROS2 independent storage format to store serialized ROS2 messages";
  };
}
