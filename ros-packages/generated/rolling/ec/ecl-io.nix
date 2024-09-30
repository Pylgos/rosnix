{
  ament-cmake-ros,
  buildRosPackage,
  ecl-build,
  ecl-config,
  ecl-errors,
  ecl-license,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ecl_io" = substituteSource {
      src = fetchgit {
        name = "ecl_io-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "1e442ac33f0c10fc58b575420ecb1ef33f79a277";
        hash = "sha256-I434FhFkRvH1CxPDYASTtfmyT/mK0OLoVA+VPEiSa24=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ecl_io";
  version = "1.2.0-4";
  src = sources."ecl_io";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl-build ecl-config ecl-errors ecl-license ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Most implementations (windows, posix, ...) have slightly different api for low level input-output functions. These are gathered here and re-represented with a cross platform set of functions.";
  };
}
