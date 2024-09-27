{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  resource_retriever,
  rosSystemPackages,
  ros_environment,
  rosgraph_msgs,
  rosx_introspection,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    foxglove_bridge-488ba6a290f4df44a014b70da8c39e925ea7af59 = substituteSource {
      src = fetchgit {
        name = "foxglove_bridge-488ba6a290f4df44a014b70da8c39e925ea7af59-source";
        url = "https://github.com/ros2-gbp/foxglove_bridge-release.git";
        rev = "488ba6a290f4df44a014b70da8c39e925ea7af59";
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
  src = sources.foxglove_bridge-488ba6a290f4df44a014b70da8c39e925ea7af59;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp rclcpp rclcpp_components resource_retriever rosgraph_msgs rosx_introspection ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" "libssl-dev" "libwebsocketpp-dev" "nlohmann-json-dev" "openssl" "zlib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto std_msgs std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS Foxglove Bridge";
  };
}
