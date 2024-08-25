{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_pep257,
  ament_cmake_uncrustify,
  ament_index_python,
  ament_lint_auto,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_ros,
  launch_testing_ament_cmake,
  launch_testing_ros,
  rclcpp,
  rclcpp_lifecycle,
  ros2run,
  substituteSource,
  system_modes_msgs,
}:
let
  sources = rec {
    system_modes = substituteSource {
      src = fetchgit {
        name = "system_modes-source";
        url = "https://github.com/ros2-gbp/system_modes-release.git";
        rev = "a0f0d51ec9e8a39de107a8403f4969a62e2d9413";
        hash = "sha256-0KjnR6c32kc4yM0vwAGYI1LgRZn4tLfIZSO+UE2llbM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "system_modes";
  version = "0.9.0-5";
  src = sources.system_modes;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces launch_ros rclcpp rclcpp_lifecycle system_modes_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_gmock ament_cmake_gtest ament_cmake_pep257 ament_cmake_uncrustify ament_index_python ament_lint_auto launch_testing_ament_cmake launch_testing_ros ros2run ];
  missingDependencies = [  ];
  meta = {
    description = "The system modes concept assumes that a robotics system is built from components with a lifecycle. It adds a notion of (sub-)systems, hiararchically grouping these nodes, as well as a notion of modes that determine the configuration of these nodes and (sub-)systems in terms of their parameter values.";
  };
}
