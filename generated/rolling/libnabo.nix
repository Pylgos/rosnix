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
        rev = "9e3e3ae45e0b4cb8d11edd4beabe849a5cdb393b";
        hash = "sha256-N2OmCLgobiplRxZeGlO7vZjCf68vvQms7EMT4yreN2c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libnabo";
  version = "1.1.1-1";
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
