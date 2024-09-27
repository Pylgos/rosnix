{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_clang_format,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  event_camera_codecs,
  event_camera_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pybind11_vendor,
  python_cmake_module,
  rclpy,
  rosSystemPackages,
  ros_environment,
  rosbag2_py,
  rosbag2_storage_default_plugins,
  rosidl_runtime_py,
  rpyutils,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "event_camera_py" = substituteSource {
      src = fetchgit {
        name = "event_camera_py-source";
        url = "https://github.com/ros2-gbp/event_camera_py-release.git";
        rev = "d8d4e7da07d442fb6c0a5293960c10c1ee4194e2";
        hash = "sha256-HVgDdepsNCe6JZ99bjcAJCaX3dKNocNo65RDq2tvwok=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "event_camera_py";
  version = "1.0.6-1";
  src = sources."event_camera_py";
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_python ament_cmake_ros python_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ event_camera_codecs event_camera_msgs pybind11_vendor rpyutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_clang_format ament_cmake_pytest ament_lint_auto ament_lint_common rclpy rosbag2_py rosbag2_storage_default_plugins rosidl_runtime_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  meta = {
    description = "Python access for event_camera_msgs.";
  };
}
