{
  ament_cmake_python,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pybind11_vendor,
  python3Packages,
  python_cmake_module,
  rcl_interfaces,
  rclpy,
  rosbag2_compression,
  rosbag2_compression_zstd,
  rosbag2_cpp,
  rosbag2_storage,
  rosbag2_storage_default_plugins,
  rosbag2_test_common,
  rosbag2_test_msgdefs,
  rosbag2_transport,
  rosidl_runtime_py,
  rpyutils,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_py = substituteSource {
      src = fetchgit {
        name = "rosbag2_py-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "d0aa54ab8f7742dc69706a2232233fa94155ebe5";
        hash = "sha256-6AX9hd2I1XveB4iQYPmMXWVnhWHk9T/8DndTRVENvU8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_py";
  version = "0.26.5-1";
  src = sources.rosbag2_py;
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros python_cmake_module ];
  propagatedNativeBuildInputs = [ rpyutils ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pybind11_vendor rclpy rosbag2_compression rosbag2_cpp rosbag2_storage rosbag2_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common python3Packages.pytest rcl_interfaces rosbag2_compression_zstd rosbag2_storage_default_plugins rosbag2_test_common rosbag2_test_msgdefs rosidl_runtime_py std_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Python API for rosbag2";
  };
}
