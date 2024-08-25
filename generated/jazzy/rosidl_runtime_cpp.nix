{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  performance_test_fixture,
  rosidl_runtime_c,
  substituteSource,
}:
let
  sources = rec {
    rosidl_runtime_cpp = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "bef252b1cedc0f99956d56fc09a1f19b59534c4e";
        hash = "sha256-KJ63ZYA74bwaGDSI9lZ0J5Cv+iuidH0yytBeYKyGwj8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_runtime_cpp";
  version = "4.6.3-1";
  src = sources.rosidl_runtime_cpp;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_runtime_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common performance_test_fixture ];
  missingDependencies = [  ];
  meta = {
    description = "Provides definitions and templated functions for getting and working with rosidl typesupport types in C++.";
  };
}
