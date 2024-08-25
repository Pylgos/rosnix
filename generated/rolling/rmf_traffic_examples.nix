{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  rmf_traffic,
  substituteSource,
}:
let
  sources = rec {
    rmf_traffic_examples = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_examples-source";
        url = "https://github.com/ros2-gbp/rmf_traffic-release.git";
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
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rmf_traffic ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Examples of how to use the rmf_traffic library";
  };
}
