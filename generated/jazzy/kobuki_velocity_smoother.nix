{
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_ros,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  ecl_build,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  nav_msgs,
  python3Packages,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  ros2test,
  substituteSource,
}:
let
  sources = rec {
    kobuki_velocity_smoother = substituteSource {
      src = fetchgit {
        name = "kobuki_velocity_smoother-source";
        url = "https://github.com/ros2-gbp/kobuki_velocity_smoother-release.git";
        rev = "7851383e06b59c96286db423f2e4db9287693ba9";
        hash = "sha256-kZmyem+NJit8xtwuRz5Zx8AkdojVm7/pxgSOR63CkcM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kobuki_velocity_smoother";
  version = "0.15.0-4";
  src = sources.kobuki_velocity_smoother;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build geometry_msgs nav_msgs rcl_interfaces rclcpp rclcpp_components ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_lint_cmake ament_cmake_pep257 ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto launch_testing launch_testing_ament_cmake launch_testing_ros python3Packages.matplotlib ros2test ];
  missingDependencies = [  ];
  meta = {
    description = "Bound incoming velocity messages according to robot velocity and acceleration limits.";
  };
}
