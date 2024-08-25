{
  ament_cmake,
  bond,
  bondcpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  smclib,
  substituteSource,
}:
let
  sources = rec {
    bond_core = substituteSource {
      src = fetchgit {
        name = "bond_core-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "37dcfcd24735776aa874b749575f1c6ebd5787ff";
        hash = "sha256-pieGbpeYdGAOAULspCbQLtOYRAMogAi8zxZoMZkCNJI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bond_core";
  version = "4.1.0-1";
  src = sources.bond_core;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bond bondcpp smclib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "A bond allows two processes, A and B, to know when the other has terminated, either cleanly or by crashing. The bond remains connected until it is either broken explicitly or until a heartbeat times out.";
  };
}
