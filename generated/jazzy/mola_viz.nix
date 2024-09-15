{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_kernel,
  mrpt_libgui,
  mrpt_libmaps,
  mrpt_libopengl,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    mola_viz = substituteSource {
      src = fetchgit {
        name = "mola_viz-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "b9d4adefad6a22d77596f92299e8e54d1930776b";
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
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola_kernel mrpt_libgui mrpt_libmaps mrpt_libopengl ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "GUI for MOLA";
  };
}
