{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_kernel,
  mrpt2,
  substituteSource,
}:
let
  sources = rec {
    mola_viz = substituteSource {
      src = fetchgit {
        name = "mola_viz-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "7fa47f79e59494e07242761693fa14b958e17b12";
        hash = "sha256-+gW6VJDQSWAQzhBYhZmcSOfLrj6So//PN1W4blZyG+w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_viz";
  version = "1.1.0-1";
  src = sources.mola_viz;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_kernel mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "GUI for MOLA";
  };
}
