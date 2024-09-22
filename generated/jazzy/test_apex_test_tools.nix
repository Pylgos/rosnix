{
  ament_cmake_auto,
  ament_lint_auto,
  apex_test_tools,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    test_apex_test_tools = substituteSource {
      src = fetchFromGitHub {
        name = "test_apex_test_tools-source";
        owner = "ros2-gbp";
        repo = "apex_test_tools-release";
        rev = "590ff5f45328eaf6331bcda20fc8edd30c7dd1a8";
        hash = "sha256-ZB2lhFknuQ+9fA1s+tCKrhHEUOnSLF2ogSsE0tVMrjE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "test_apex_test_tools";
  version = "0.0.2-9";
  src = sources.test_apex_test_tools;
  nativeBuildInputs = [ ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto apex_test_tools ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Test package, which uses things exported by apex_test_tools";
  };
}
