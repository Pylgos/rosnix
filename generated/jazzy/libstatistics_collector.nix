{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  performance_test_fixture,
  rcl,
  rcpputils,
  rcutils,
  rmw,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  statistics_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    libstatistics_collector = substituteSource {
      src = fetchgit {
        name = "libstatistics_collector-source";
        url = "https://github.com/ros2-gbp/libstatistics_collector-release.git";
        rev = "19d619f753118a3cae6e41d2f9974d9a37fea539";
        hash = "sha256-cvI6rweNMAPnISrPDjCi0dRMq6O79AA7JWqrBt01vEA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libstatistics_collector";
  version = "1.7.3-1";
  src = sources.libstatistics_collector;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rcl rcpputils rmw statistics_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common performance_test_fixture rcutils rosidl_default_generators rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Lightweight aggregation utilities to collect statistics and measure message metrics.";
  };
}
