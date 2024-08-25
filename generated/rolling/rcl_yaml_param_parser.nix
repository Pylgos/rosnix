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
  libyaml,
  libyaml_vendor,
  mimick_vendor,
  osrf_testing_tools_cpp,
  performance_test_fixture,
  rcutils,
  rmw,
  substituteSource,
}:
let
  sources = rec {
    rcl_yaml_param_parser = substituteSource {
      src = fetchgit {
        name = "rcl_yaml_param_parser-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "e8b5b46aaa39c4279c8b023ef75eeee0b3d6175d";
        hash = "sha256-te5lmGHl5WJlqe4nXftjz2BHI3I4C+/BAJRbHrqPfS0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_yaml_param_parser";
  version = "9.4.1-1";
  src = sources.rcl_yaml_param_parser;
  nativeBuildInputs = [ ament_cmake_gen_version_h ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libyaml libyaml_vendor rcutils rmw ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common mimick_vendor osrf_testing_tools_cpp performance_test_fixture ];
  missingDependencies = [  ];
  meta = {
    description = "Parse a YAML parameter file and populate the C data structure.";
  };
}
