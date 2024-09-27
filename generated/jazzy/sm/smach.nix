{
  ament_cmake,
  ament_cmake_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    smach-b15e2d1392843c513a463dce44ef17bf45b1c103 = substituteSource {
      src = fetchgit {
        name = "smach-b15e2d1392843c513a463dce44ef17bf45b1c103-source";
        url = "https://github.com/ros2-gbp/executive_smach-release.git";
        rev = "b15e2d1392843c513a463dce44ef17bf45b1c103";
        hash = "sha256-vyRxq6EM6nOhjwQFIV+ikGPs5Wr0pb7e9iAq8+R8cwo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "smach";
  version = "3.0.3-3";
  src = sources.smach-b15e2d1392843c513a463dce44ef17bf45b1c103;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "SMACH is a task-level architecture for rapidly creating complex robot behavior. At its core, SMACH is a ROS-independent Python library to build hierarchical state machines. SMACH is a new library that takes advantage of very old concepts in order to quickly create robust robot behavior with maintainable and modular code.";
  };
}
