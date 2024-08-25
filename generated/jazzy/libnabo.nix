{
  buildRosPackage,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    libnabo = substituteSource {
      src = fetchgit {
        name = "libnabo-source";
        url = "https://github.com/ros2-gbp/libnabo-release.git";
        rev = "160592c7ea514f53d953d86d718910a908cbfd21";
        hash = "sha256-v97tjlJi2QXQYpa3qut6ICB4FlDDEz6GBYMY9ParEWw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libnabo";
  version = "1.1.1-2";
  src = sources.libnabo;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "libnabo is a fast K Nearest Neighbour library for low-dimensional spaces.";
  };
}
