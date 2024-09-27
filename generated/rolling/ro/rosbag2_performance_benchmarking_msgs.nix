{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_cmake,
  rosidl_default_generators,
  rosidl_default_runtime,
  rosidl_typesupport_cpp,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_performance_benchmarking_msgs-480c579948bca20427e1b0c4dc5fb249c0342b84 = substituteSource {
      src = fetchgit {
        name = "rosbag2_performance_benchmarking_msgs-480c579948bca20427e1b0c4dc5fb249c0342b84-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "480c579948bca20427e1b0c4dc5fb249c0342b84";
        hash = "sha256-HQI37fLB/tAg9E4dbahXHiYVoWMsGTnDMpm7khDz5Cs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_performance_benchmarking_msgs";
  version = "0.29.0-1";
  src = sources.rosbag2_performance_benchmarking_msgs-480c579948bca20427e1b0c4dc5fb249c0342b84;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common rosidl_cmake rosidl_typesupport_cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing rosbag2 performance benchmarking specific messages.";
  };
}
