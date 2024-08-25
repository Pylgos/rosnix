{
  ament_cmake_gen_version_h,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  osrf_testing_tools_cpp,
  rcl,
  rcutils,
  rmw,
  rosidl_runtime_c,
  substituteSource,
  tracetools,
}:
let
  sources = rec {
    rcl_lifecycle = substituteSource {
      src = fetchgit {
        name = "rcl_lifecycle-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "097c2e0ef9f887ca6def7a3b86cf4ec181de5017";
        hash = "sha256-gOUlGVmqmO0WUkYBNnpvVEmx16+rYfts9EZ/qGc2DQ4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_lifecycle";
  version = "9.4.1-1";
  src = sources.rcl_lifecycle;
  nativeBuildInputs = [ ament_cmake_gen_version_h ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rcl rcutils rmw rosidl_runtime_c tracetools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common osrf_testing_tools_cpp ];
  missingDependencies = [  ];
  meta = {
    description = "Package containing a C-based lifecycle implementation";
  };
}
