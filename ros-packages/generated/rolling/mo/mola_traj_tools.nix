{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt_libposes,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    mola_traj_tools-b8e538ccaae958d5e1193843ee76f8469cd447d5 = substituteSource {
      src = fetchgit {
        name = "mola_traj_tools-b8e538ccaae958d5e1193843ee76f8469cd447d5-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "b8e538ccaae958d5e1193843ee76f8469cd447d5";
        hash = "sha256-i0PcdeRApOD+JGcEwexpFnjySRIfTPUW2C5wVZKy9Qw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_traj_tools";
  version = "1.2.0-1";
  src = sources.mola_traj_tools-b8e538ccaae958d5e1193843ee76f8469cd447d5;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola_common mrpt_libposes ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "CLI tools to manipulate trajectory files as a complement to the evo package";
  };
}
