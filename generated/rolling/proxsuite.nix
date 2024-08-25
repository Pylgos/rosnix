{
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
        rev = "66e547dc78521793ba4ec7d0efb48fe3a00bf0a4";
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
  propagatedNativeBuildInputs = [ doxygen git ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen python3Packages.numpy python3Packages.scipy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ matio ];
  missingDependencies = [ "simde" ];
  meta = {
    description = "The Advanced Proximal Optimization Toolbox";
  };
}
