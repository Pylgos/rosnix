{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_kernel,
  mrpt_libgui,
  mrpt_libmaps,
  mrpt_libopengl,
  substituteSource,
}:
let
  sources = rec {
    mola_viz = substituteSource {
      src = fetchgit {
        name = "mola_viz-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "3150cd51633363b2abf6139724d6675ecf6a3a5d";
        hash = "sha256-rX+LZO1znR2AY0lpUa8SKKndRK5IkRlWh2VYXupA9tg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_viz";
  version = "1.1.3-1";
  src = sources.mola_viz;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_kernel mrpt_libgui mrpt_libmaps mrpt_libopengl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "GUI for MOLA";
  };
}
