{
  ament_cmake,
  ament_cmake_gmock,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rcpputils,
  ros2bag,
  rosbag2_compression,
  rosbag2_compression_zstd,
  rosbag2_cpp,
  rosbag2_interfaces,
  rosbag2_storage,
  rosbag2_storage_default_plugins,
  rosbag2_test_common,
  rosbag2_transport,
  std_msgs,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rosbag2_tests = substituteSource {
      src = fetchgit {
        name = "rosbag2_tests-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "3a4ec2edbbb90840d87ba5340144c4a080a12a01";
        hash = "sha256-FPqSzA+T016+r35mglc0zHYhWatPi132RXLPsIJMdPw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_tests";
  version = "0.29.0-1";
  src = sources.rosbag2_tests;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_lint_auto ament_lint_common rclcpp rcpputils ros2bag rosbag2_compression rosbag2_compression_zstd rosbag2_cpp rosbag2_interfaces rosbag2_storage rosbag2_storage_default_plugins rosbag2_test_common rosbag2_transport std_msgs test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Tests package for rosbag2";
  };
}
