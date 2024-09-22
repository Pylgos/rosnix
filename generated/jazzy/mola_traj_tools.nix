{
  buildRosPackage,
  fetchFromGitHub,
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
      src = fetchFromGitHub {
        name = "mola_traj_tools-source";
        owner = "ros2-gbp";
        repo = "mola-release";
        rev = "2b6d62e9712b7b5a4e733c39c7552b9137e713ee";
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
