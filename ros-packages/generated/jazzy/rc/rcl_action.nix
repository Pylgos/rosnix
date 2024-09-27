{
  action_msgs,
  ament_cmake_gen_version_h,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  osrf_testing_tools_cpp,
  rcl,
  rcutils,
  rmw,
  rmw_implementation_cmake,
  rosSystemPackages,
  rosidl_runtime_c,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rcl_action-868ff9095314171d56b2fd487e1845348d94e4df = substituteSource {
      src = fetchgit {
        name = "rcl_action-868ff9095314171d56b2fd487e1845348d94e4df-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "868ff9095314171d56b2fd487e1845348d94e4df";
        hash = "sha256-TklJN5nQBFMMQvVnkzTMwotHnnBQ72KPI2LiaGnYghk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_action";
  version = "9.2.4-1";
  src = sources.rcl_action-868ff9095314171d56b2fd487e1845348d94e4df;
  nativeBuildInputs = [ ament_cmake_gen_version_h ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action_msgs rcl rcutils rmw rosidl_runtime_c ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common osrf_testing_tools_cpp rmw_implementation_cmake test_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package containing a C-based ROS action implementation";
  };
}
