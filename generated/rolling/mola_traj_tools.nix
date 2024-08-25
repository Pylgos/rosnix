{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt2,
  substituteSource,
}:
let
  sources = rec {
    mola_traj_tools = substituteSource {
      src = fetchgit {
        name = "mola_traj_tools-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "0c5bd8bbdabfea88440d50920007e422f8b93c3a";
        hash = "sha256-BbN+rXZQSfeDOjD2tgtw8QyvdQUPVq2RZMo4i11WhqM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_traj_tools";
  version = "1.1.0-1";
  src = sources.mola_traj_tools;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "CLI tools to manipulate trajectory files as a complement to the evo package";
  };
}
