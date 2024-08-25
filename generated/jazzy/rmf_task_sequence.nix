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
        rev = "d571a0315533786952852c1e372bb868a43bf059";
        hash = "sha256-9OH24N9NPVg+Uw3eMjJKKfPn7qJZJ3VjcAnc68hJ3Qc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_task_sequence";
  version = "2.5.1-1";
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
