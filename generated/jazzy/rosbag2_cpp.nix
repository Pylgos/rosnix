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
  rosSystemPackages,
  rosbag2_storage,
  rosbag2_storage_default_plugins,
  rosbag2_test_common,
  rosbag2_test_msgdefs,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  rosidl_typesupport_cpp,
  rosidl_typesupport_introspection_cpp,
  shared_queues_vendor,
  std_msgs,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rosbag2_cpp = substituteSource {
      src = fetchgit {
        name = "rosbag2_cpp-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "09507dc0de06676db0318ad244f43f59b50ad221";
        hash = "sha256-le/u2gVdo2o4zd9Q0WvbZkPiYwiQYrWY1XMkee7uowI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_cpp";
  version = "0.26.5-1";
  src = sources.rosbag2_cpp;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp pluginlib rclcpp rcpputils rcutils rmw rmw_implementation rosbag2_storage rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_cpp rosidl_typesupport_introspection_cpp shared_queues_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_lint_auto ament_lint_common rosbag2_storage_default_plugins rosbag2_test_common rosbag2_test_msgdefs std_msgs test_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "C++ ROSBag2 client library";
  };
}
