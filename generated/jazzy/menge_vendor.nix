{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pkg-config,
  substituteSource,
  tinyxml,
}:
let
  sources = rec {
    menge_vendor = substituteSource {
      src = fetchgit {
        name = "menge_vendor-source";
        url = "https://github.com/ros2-gbp/menge_vendor-release.git";
        rev = "dc8e4100a05e84a960dcb1362a6c08fd42f7cb06";
        hash = "sha256-AJu4LBC/jCbOc7xsuWQYqlSM6c4VDKO69VNdPQljsDE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "menge_vendor";
  version = "1.2.1-1";
  src = sources.menge_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tinyxml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Menge is a powerful, cross-platform, modular framework for crowd simulation developed at the University of North Carolina - Chapel Hill. This package includes the core simulation part of origin menge package, with a bit modification for crowd simulation in gazebo and ignition gazebo.";
  };
}
