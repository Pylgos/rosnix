{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt_libposes,
  substituteSource,
}:
let
  sources = rec {
    mola_traj_tools = substituteSource {
      src = fetchgit {
        name = "mola_traj_tools-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "fd6a0775a0f77d617942494b50f7ba362b581215";
        hash = "sha256-YN12/B9PibzVO8boxppsJRgcDsii3L/OszwsgEqxzN4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_traj_tools";
  version = "1.1.3-1";
  src = sources.mola_traj_tools;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mrpt_libposes ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "CLI tools to manipulate trajectory files as a complement to the evo package";
  };
}
