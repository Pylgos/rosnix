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
        rev = "d09ba6a8e9ad269bb2a8c040ca6ac6f0b96a78f1";
        hash = "sha256-4RoVLck4aAUfpX/d4/u+KRlM4Q0+ql8j9jKdqRTNLJI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_storage";
  version = "0.26.4-1";
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
