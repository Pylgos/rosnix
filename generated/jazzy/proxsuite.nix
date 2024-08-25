{
  buildPackages,
  buildRosPackage,
  cmake,
  doxygen,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  matio,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    proxsuite = substituteSource {
      src = fetchgit {
        name = "proxsuite-source";
        url = "https://github.com/ros2-gbp/proxsuite-release.git";
        rev = "b1b7dbc9106d896b347c4d5db9d01de37e0c2a2c";
        hash = "sha256-Qfv+vWLLcZfUtZpRYZaoL3rQ3ibCYBKQcAkpFP0YdWI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "proxsuite";
  version = "0.6.5-1";
  src = sources.proxsuite;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ doxygen git buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen python3Packages.scipy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ matio ];
  missingDependencies = [ "simde" ];
  meta = {
    description = "The Advanced Proximal Optimization Toolbox";
  };
}
