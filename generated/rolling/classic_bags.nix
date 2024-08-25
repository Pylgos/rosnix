{
  ament_cmake,
  ament_cmake_pytest,
  ament_cmake_python,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclpy,
  rosbag2_cpp,
  rosbag2_py,
  rosbag2_storage,
  rosbag2_storage_mcap,
  rosbag2_storage_sqlite3,
  rosidl_runtime_py,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    classic_bags = substituteSource {
      src = fetchgit {
        name = "classic_bags-source";
        url = "https://github.com/ros2-gbp/classic_bags-release.git";
        rev = "e2538f43275fa7e7c37016cad69ba2a72e9dff4e";
        hash = "sha256-ZJSMrs9eRmeojheIs6GQcdz6FbdvasObPF8AjZg6XQM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "classic_bags";
  version = "0.4.0-1";
  src = sources.classic_bags;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rclcpp rclpy rosbag2_cpp rosbag2_py rosbag2_storage rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest rosbag2_storage_mcap rosbag2_storage_sqlite3 std_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "A ROS 2 interface in the style of ROS 1 for reading and writing bag files";
  };
}
