{
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ament_cmake,
  mimick_vendor,
  osrf_testing_tools_cpp,
  performance_test_fixture,
  substituteSource,
}:
let
  sources = rec {
    rcutils = substituteSource {
      src = fetchgit {
        name = "rcutils-source";
        url = "https://github.com/ros2-gbp/rcutils-release.git";
        rev = "5ca47e994c11468bc2c88c9a46453913e2d31ade";
        hash = "sha256-iS/Yu3h9xFDAhI33CrRiEtctqKcdt6V0Vkq2RaZbR3s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcutils";
  version = "6.9.1-1";
  src = sources.rcutils;
  nativeBuildInputs = [ ament_cmake_ros buildPackages.python3Packages.empy ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing launch_testing_ament_cmake mimick_vendor osrf_testing_tools_cpp performance_test_fixture ];
  missingDependencies = [  ];
  meta = {
    description = "Package containing various utility types and functions for C";
  };
}
