{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-cmake,
  rosidl-default-generators,
  rosidl-default-runtime,
  rosidl-typesupport-cpp,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rosbag2_performance_benchmarking_msgs" = substituteSource {
      src = fetchgit {
        name = "rosbag2_performance_benchmarking_msgs-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "f8420fa96635703e9533762a50cf30834e4f5872";
        hash = "sha256-mFdysfbJUO+WUfLcV10uR67clngtlHXVk0pfgGHsoxU=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rosbag2_performance_benchmarking_msgs";
  version = "0.26.5-1";
  src = sources."rosbag2_performance_benchmarking_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl-default-runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosidl-cmake rosidl-typesupport-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing rosbag2 performance benchmarking specific messages.";
  };
}
