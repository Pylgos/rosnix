{
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rcutils = substituteSource {
      src = fetchgit {
        name = "rcutils-source";
        url = "https://github.com/ros2-gbp/rcutils-release.git";
        rev = "231651e11856d5b67fb974f8a883518ecec517d3";
        hash = "sha256-DWxGjI2rWFQBJjjF9utBibURGUJATRrpb7lA6B+YAx4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcutils";
  version = "6.9.2-1";
  src = sources.rcutils;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-empy" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libatomic" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing launch_testing_ament_cmake mimick_vendor osrf_testing_tools_cpp performance_test_fixture ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package containing various utility types and functions for C";
  };
}
