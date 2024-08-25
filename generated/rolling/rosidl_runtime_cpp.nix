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
        rev = "8c0a60b8ddda2f8461b5a9740da31c657a5580e1";
        hash = "sha256-FgYoJHEo1lPsDoTLgj4j4AmfrNoIDb+NEGH2SUH+xpc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_runtime_cpp";
  version = "4.8.1-1";
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
