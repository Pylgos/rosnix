{
  ament_cmake,
  bond,
  bondcpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  smclib,
  substituteSource,
}:
let
  sources = rec {
    bond_core-37dcfcd24735776aa874b749575f1c6ebd5787ff = substituteSource {
      src = fetchgit {
        name = "bond_core-37dcfcd24735776aa874b749575f1c6ebd5787ff-source";
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
  src = sources.bond_core-37dcfcd24735776aa874b749575f1c6ebd5787ff;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ bond bondcpp smclib ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A bond allows two processes, A and B, to know when the other has terminated, either cleanly or by crashing. The bond remains connected until it is either broken explicitly or until a heartbeat times out.";
  };
}
