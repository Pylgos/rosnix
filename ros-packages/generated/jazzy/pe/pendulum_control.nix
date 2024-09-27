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
  pendulum_msgs,
  rclcpp,
  rmw_implementation_cmake,
  ros2run,
  rosSystemPackages,
  rttest,
  substituteSource,
  tlsf_cpp,
}:
let
  sources = rec {
    pendulum_control-9c41f54d091d0e65ce9ca393779b066247e4f793 = substituteSource {
      src = fetchgit {
        name = "pendulum_control-9c41f54d091d0e65ce9ca393779b066247e4f793-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "9c41f54d091d0e65ce9ca393779b066247e4f793";
        hash = "sha256-zBBWIeQBw01hP3nP2HNVs6iPduXjXSSXMSELX/n2JHQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pendulum_control";
  version = "0.33.5-1";
  src = sources.pendulum_control-9c41f54d091d0e65ce9ca393779b066247e4f793;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pendulum_msgs rclcpp rttest tlsf_cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing launch_testing_ament_cmake launch_testing_ros rmw_implementation_cmake ros2run ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Demonstrates ROS 2's realtime capabilities with a simulated inverted pendulum.";
  };
}
