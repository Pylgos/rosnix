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
        rev = "ce5771d365180496a672d93826664df83baa98ae";
        hash = "sha256-lwEyd62jInhq9Ln3NiUEt6sB9cggMg6KqszeaVL2/EA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcutils";
  version = "6.7.1-1";
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
