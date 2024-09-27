{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    smclib-1790dcfb4e6720bdaf5630dd1a47c4d73ca5f255 = substituteSource {
      src = fetchgit {
        name = "smclib-1790dcfb4e6720bdaf5630dd1a47c4d73ca5f255-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "1790dcfb4e6720bdaf5630dd1a47c4d73ca5f255";
        hash = "sha256-0GdXtzthCDeBP6DCt4Gd6e86nzEmrdCJNLuxyDTGGK4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "smclib";
  version = "4.1.0-1";
  src = sources.smclib-1790dcfb4e6720bdaf5630dd1a47c4d73ca5f255;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The State Machine Compiler (SMC) from http://smc.sourceforge.net/ converts a language-independent description of a state machine into the source code to support that state machine. This package contains the libraries that a compiled state machine depends on, but it does not contain the compiler itself.";
  };
}
