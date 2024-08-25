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
        rev = "f2c0b8fbd6da6446b55c5da6583ceeffc7818fca";
        hash = "sha256-TpmzYPZ+36H+OGt00z8kZqNs+L3JOcpDoVCAtONyQHw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdfdom_headers";
  version = "1.1.1-2";
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
