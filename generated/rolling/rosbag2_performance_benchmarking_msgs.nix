{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_cmake,
  rosidl_default_generators,
  rosidl_default_runtime,
  rosidl_typesupport_cpp,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_performance_benchmarking_msgs = substituteSource {
      src = fetchgit {
        name = "rosbag2_performance_benchmarking_msgs-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "1f6c49cb67696697474a25122837d68aec27f3de";
        hash = "sha256-Z0J9SGS1fB4PZ8SEV4dP0IiWUrXyK/b72XzvUlZW7+8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_performance_benchmarking_msgs";
  version = "0.28.0-1";
  src = sources.rosbag2_performance_benchmarking_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common rosidl_cmake rosidl_typesupport_cpp ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing rosbag2 performance benchmarking specific messages.";
  };
}
