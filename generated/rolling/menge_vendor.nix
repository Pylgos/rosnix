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
        rev = "cb01b076660d10b31575cfc16bbf4b1d828d18ea";
        hash = "sha256-S+Ns9vIuul9KZVyxvo98m4TJAMvJzj0WWPzIwq/RTuc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "menge_vendor";
  version = "1.3.0-1";
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
