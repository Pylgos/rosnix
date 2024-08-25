{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  ament_lint_auto,
  asio,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nlohmann_json,
  openssl,
  rclcpp,
  rclcpp_components,
  resource_retriever,
  ros_environment,
  rosgraph_msgs,
  rosx_introspection,
  std_msgs,
  std_srvs,
  substituteSource,
  websocketpp,
  zlib,
}:
let
  sources = rec {
    foxglove_bridge = substituteSource {
      src = fetchgit {
        name = "foxglove_bridge-source";
        url = "https://github.com/ros2-gbp/foxglove_bridge-release.git";
        rev = "74c97342e76388a9ac8340ce319e4f2800c9e717";
        hash = "sha256-55+rvWwEo3BQQ39q4jHC7MXaagY3vheCEPc3TnNeZZ0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "foxglove_bridge";
  version = "0.8.0-1";
  src = sources.foxglove_bridge;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp asio nlohmann_json openssl rclcpp rclcpp_components resource_retriever rosgraph_msgs rosx_introspection websocketpp zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto std_msgs std_srvs ];
  missingDependencies = [  ];
  meta = {
    description = "ROS Foxglove Bridge";
  };
}
