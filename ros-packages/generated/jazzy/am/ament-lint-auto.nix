{
  ament-cmake-core,
  ament-cmake-test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ament_lint_auto" = substituteSource {
      src = fetchgit {
        name = "ament_lint_auto-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "9dfbe5dc5dc7367e57c8df22283e0a2d9c674511";
        hash = "sha256-cTEKLki3mpr0mnz11IYBahCl0Pn7oWCg5BfIwzUCvU4=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ament_lint_auto";
  version = "0.17.1-1";
  src = sources."ament_lint_auto";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The auto-magic functions for ease to use of the ament linters in CMake.";
  };
}
