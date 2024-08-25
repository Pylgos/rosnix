{
  ament_cmake_gmock,
  ament_cmake_ros,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  composition_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  keyboard_handler,
  rclcpp,
  rclcpp_components,
  rmw,
  rmw_implementation_cmake,
  rosbag2_compression,
  rosbag2_compression_zstd,
  rosbag2_cpp,
  rosbag2_interfaces,
  rosbag2_storage,
  rosbag2_storage_default_plugins,
  rosbag2_test_common,
  shared_queues_vendor,
  substituteSource,
  test_msgs,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    rosbag2_transport = substituteSource {
      src = fetchgit {
        name = "rosbag2_transport-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "6a3ee805e544f81aab3a5706644dc915ba9d33a3";
        hash = "sha256-QgzfxzYIT/Dhy1uYfgzrHHlUNPSeUP5EN0gOcUX0+kg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_transport";
  version = "0.28.0-1";
  src = sources.rosbag2_transport;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ keyboard_handler rclcpp rclcpp_components rmw rosbag2_compression rosbag2_cpp rosbag2_interfaces rosbag2_storage shared_queues_vendor yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_index_cpp ament_lint_auto ament_lint_common composition_interfaces rmw_implementation_cmake rosbag2_compression_zstd rosbag2_storage_default_plugins rosbag2_test_common test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Layer encapsulating ROS middleware to allow rosbag2 to be used with or without middleware";
  };
}
