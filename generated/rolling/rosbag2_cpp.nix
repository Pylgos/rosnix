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
  pluginlib,
  rclcpp,
  rcpputils,
  rcutils,
  rmw,
  rmw_implementation,
  rosbag2_storage,
  rosbag2_storage_default_plugins,
  rosbag2_test_common,
  rosbag2_test_msgdefs,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  rosidl_typesupport_cpp,
  rosidl_typesupport_introspection_cpp,
  shared_queues_vendor,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rosbag2_cpp = substituteSource {
      src = fetchgit {
        name = "rosbag2_cpp-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "ed712c3f61f41da80de198f4e556aa3fbf683cd8";
        hash = "sha256-Sh+LAZYhIiy0qsfz06DmpEI34R+bi3f7Rt1iRC3VYTY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_cpp";
  version = "0.28.0-1";
  src = sources.rosbag2_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp pluginlib rclcpp rcpputils rcutils rmw rmw_implementation rosbag2_storage rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_cpp rosidl_typesupport_introspection_cpp shared_queues_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_lint_auto ament_lint_common rosbag2_storage_default_plugins rosbag2_test_common rosbag2_test_msgdefs test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "C++ ROSBag2 client library";
  };
}
