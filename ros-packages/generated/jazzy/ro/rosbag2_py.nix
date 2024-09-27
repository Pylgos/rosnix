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
  python_cmake_module,
  rcl_interfaces,
  rclpy,
  rosSystemPackages,
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
    rosbag2_py-d0aa54ab8f7742dc69706a2232233fa94155ebe5 = substituteSource {
      src = fetchgit {
        name = "rosbag2_py-d0aa54ab8f7742dc69706a2232233fa94155ebe5-source";
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
  src = sources.rosbag2_py-d0aa54ab8f7742dc69706a2232233fa94155ebe5;
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros python_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rpyutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pybind11_vendor rclpy rosbag2_compression rosbag2_cpp rosbag2_storage rosbag2_transport ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common rcl_interfaces rosbag2_compression_zstd rosbag2_storage_default_plugins rosbag2_test_common rosbag2_test_msgdefs rosidl_runtime_py std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Python API for rosbag2";
  };
}
