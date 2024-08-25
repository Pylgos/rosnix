{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    moveit_resources_prbt_support = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_support-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "6e0d73e81e61b35524cb3fd7348318881affb6ff";
        hash = "sha256-lAWIBlYGwRc0l2Zzos29VCzMyDmR5ajjrM1Jj05ToJM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_prbt_support";
  version = "2.10.0-1";
  src = sources.moveit_resources_prbt_support;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Mechanical, kinematic and visual description of the Pilz light weight arm PRBT.";
  };
}
