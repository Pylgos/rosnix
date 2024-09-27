{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  rclcpp,
  rclcpp_components,
  rmw_fastrtps_cpp,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    demo_nodes_cpp_native-a45980e89dc5ee078670097e3ef3bbb0a9288b7e = substituteSource {
      src = fetchgit {
        name = "demo_nodes_cpp_native-a45980e89dc5ee078670097e3ef3bbb0a9288b7e-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "a45980e89dc5ee078670097e3ef3bbb0a9288b7e";
        hash = "sha256-/1VnShtV/j2qmWMvzdkhw9yTivw2jxcQdDqR5zRH8xE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "demo_nodes_cpp_native";
  version = "0.33.5-1";
  src = sources.demo_nodes_cpp_native-a45980e89dc5ee078670097e3ef3bbb0a9288b7e;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp_components rmw_fastrtps_cpp std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing launch_testing_ament_cmake launch_testing_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "C++ nodes which access the native handles of the rmw implementation.";
  };
}
