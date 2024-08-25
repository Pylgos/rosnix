{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    urdfdom_headers = substituteSource {
      src = fetchgit {
        name = "urdfdom_headers-source";
        url = "https://github.com/ros2-gbp/urdfdom_headers-release.git";
        rev = "985a8402c401e898526b55c4eb23069276262d3d";
        hash = "sha256-TpmzYPZ+36H+OGt00z8kZqNs+L3JOcpDoVCAtONyQHw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdfdom_headers";
  version = "1.1.1-3";
  src = sources.urdfdom_headers;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "C++ headers for URDF.";
  };
}
