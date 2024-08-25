{
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  nlohmann_json,
  nlohmann_json_schema_validator_vendor,
  rmf_api_msgs,
  rmf_task,
  substituteSource,
}:
let
  sources = rec {
    rmf_task_sequence = substituteSource {
      src = fetchgit {
        name = "rmf_task_sequence-source";
        url = "https://github.com/ros2-gbp/rmf_task-release.git";
        rev = "59ff2883fb336b1d94a155b748e49598b5cd714c";
        hash = "sha256-ycFUnXqF4y3xtgkhD0YLyx6TLNrpYYsNQbNk9+H+ZkM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_task_sequence";
  version = "2.6.0-1";
  src = sources.rmf_task_sequence;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nlohmann_json nlohmann_json_schema_validator_vendor rmf_api_msgs rmf_task ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_catch2 ament_cmake_uncrustify ];
  missingDependencies = [  ];
  meta = {
    description = "Implementation of phase-sequence tasks for the Robotics Middleware Framework";
  };
}
