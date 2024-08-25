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
  rttest,
  substituteSource,
  tlsf_cpp,
}:
let
  sources = rec {
    pendulum_control = substituteSource {
      src = fetchgit {
        name = "pendulum_control-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "7aebd5e6f58a7c2fa5c0f81a3d77171d5da4aa23";
        hash = "sha256-cuQxIxEwdu5dmh4GXA2yYufTaxS3rMC8GT3SaduQBXs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pendulum_control";
  version = "0.33.4-1";
  src = sources.pendulum_control;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pendulum_msgs rclcpp rttest tlsf_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing launch_testing_ament_cmake launch_testing_ros rmw_implementation_cmake ros2run ];
  missingDependencies = [  ];
  meta = {
    description = "Demonstrates ROS 2's realtime capabilities with a simulated inverted pendulum.";
  };
}
