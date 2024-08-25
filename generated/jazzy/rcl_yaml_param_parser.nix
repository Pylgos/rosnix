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
        rev = "24461844ed9a5e1772ef5988261c90b0a2bf9493";
        hash = "sha256-/70LR/9CDjA2j5oY1oMNR6RmH3dIlPpTrDOsj9AyMmI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_yaml_param_parser";
  version = "9.2.3-1";
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
