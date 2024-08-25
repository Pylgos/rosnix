{
  ament_cmake_auto,
  ament_lint_auto,
  apex_test_tools,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    test_apex_test_tools = substituteSource {
      src = fetchgit {
        name = "test_apex_test_tools-source";
        url = "https://github.com/ros2-gbp/apex_test_tools-release.git";
        rev = "e22704211d12d0a0f66b10c4c0b1d6a8ac2daf89";
        hash = "sha256-ZB2lhFknuQ+9fA1s+tCKrhHEUOnSLF2ogSsE0tVMrjE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "test_apex_test_tools";
  version = "0.0.2-8";
  src = sources.test_apex_test_tools;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto apex_test_tools ];
  missingDependencies = [  ];
  meta = {
    description = "Test package, which uses things exported by apex_test_tools";
  };
}
