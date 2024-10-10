{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "smclib" = substituteSource {
      src = fetchgit {
        name = "smclib-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "8623a74afcd34db200176962b2d57582002da0f8";
        hash = "sha256-0GdXtzthCDeBP6DCt4Gd6e86nzEmrdCJNLuxyDTGGK4=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "smclib";
  version = "4.1.0-1";
  src = finalAttrs.passthru.sources."smclib";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "The State Machine Compiler (SMC) from http://smc.sourceforge.net/ converts a language-independent description of a state machine into the source code to support that state machine. This package contains the libraries that a compiled state machine depends on, but it does not contain the compiler itself.";
  };
})
