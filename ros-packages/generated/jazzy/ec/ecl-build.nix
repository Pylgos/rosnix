{
  ament-cmake,
  buildRosPackage,
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
    "ecl_build" = substituteSource {
      src = fetchgit {
        name = "ecl_build-source";
        url = "https://github.com/ros2-gbp/ecl_tools-release.git";
        rev = "d6b76b771a66754d6a4b03c493decf0a0b33c207";
        hash = "sha256-ttmcSFmWhB7bERQkup3ucja+EU9tIc4Sb4cVetuSS00=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ecl_build";
  version = "1.0.3-5";
  src = sources."ecl_build";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl-license ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Collection of cmake/make build tools primarily for ecl development itself, but also contains a few cmake modules useful outside of the ecl.";
  };
}
