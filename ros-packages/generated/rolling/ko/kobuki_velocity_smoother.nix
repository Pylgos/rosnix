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
  mkSourceSet,
  nav_msgs,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  ros2test,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "kobuki_velocity_smoother" = substituteSource {
      src = fetchgit {
        name = "kobuki_velocity_smoother-source";
        url = "https://github.com/ros2-gbp/kobuki_velocity_smoother-release.git";
        rev = "0971328fbfb8a822f3ec27da39218c6ec71f4803";
        hash = "sha256-kZmyem+NJit8xtwuRz5Zx8AkdojVm7/pxgSOR63CkcM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "kobuki_velocity_smoother";
  version = "0.15.0-3";
  src = sources."kobuki_velocity_smoother";
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build geometry_msgs nav_msgs rcl_interfaces rclcpp rclcpp_components ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_lint_cmake ament_cmake_pep257 ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto launch_testing launch_testing_ament_cmake launch_testing_ros ros2test ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-matplotlib" ]; };
  meta = {
    description = "Bound incoming velocity messages according to robot velocity and acceleration limits.";
  };
}