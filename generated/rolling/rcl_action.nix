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
  rosidl_runtime_c,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rcl_action = substituteSource {
      src = fetchgit {
        name = "rcl_action-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "7ed2d0833f31d142072ab3052c970dcb10eda127";
        hash = "sha256-NFUDSZqQhXHkrkhLsXlYyhacBdeifTRdog4rOAmK7es=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_action";
  version = "9.4.1-1";
  src = sources.rcl_action;
  nativeBuildInputs = [ ament_cmake_gen_version_h ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rcl rcutils rmw rosidl_runtime_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common osrf_testing_tools_cpp rmw_implementation_cmake test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Package containing a C-based ROS action implementation";
  };
}
