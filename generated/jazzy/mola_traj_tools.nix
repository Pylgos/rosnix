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
    mola_traj_tools = substituteSource {
      src = fetchgit {
        name = "mola_traj_tools-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "8d1473dcec3ccd8cd800bd27d8bd06f2d124e26e";
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
