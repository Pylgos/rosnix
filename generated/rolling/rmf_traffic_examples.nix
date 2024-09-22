{
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rmf_traffic,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmf_traffic_examples = substituteSource {
      src = fetchFromGitHub {
        name = "rmf_traffic_examples-source";
        owner = "ros2-gbp";
        repo = "rmf_traffic-release";
        rev = "50b6ef2d854e46b63e2d744562e2b325aff8417f";
        hash = "sha256-IM5mfeZru7UofVMMsk1bSVYMz0EhbkkpSNRXKJMD8p4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic_examples";
  version = "3.4.0-1";
  src = sources.rmf_traffic_examples;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rmf_traffic ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Examples of how to use the rmf_traffic library";
  };
}
