{
  ament_cmake,
  buildRosPackage,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_build = substituteSource {
      src = fetchgit {
        name = "ecl_build-source";
        url = "https://github.com/ros2-gbp/ecl_tools-release.git";
        rev = "fc70f1b1c5cf842334208f73a41fbf56d910eacb";
        hash = "sha256-ttmcSFmWhB7bERQkup3ucja+EU9tIc4Sb4cVetuSS00=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_build";
  version = "1.0.3-4";
  src = sources.ecl_build;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Collection of cmake/make build tools primarily for ecl development itself, but also contains a few cmake modules useful outside of the ecl.";
  };
}
