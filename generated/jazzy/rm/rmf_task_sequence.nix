{
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nlohmann_json_schema_validator_vendor,
  rmf_api_msgs,
  rmf_task,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmf_task_sequence-d571a0315533786952852c1e372bb868a43bf059 = substituteSource {
      src = fetchgit {
        name = "rmf_task_sequence-d571a0315533786952852c1e372bb868a43bf059-source";
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
  src = sources.rmf_task_sequence-d571a0315533786952852c1e372bb868a43bf059;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ nlohmann_json_schema_validator_vendor rmf_api_msgs rmf_task ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_catch2 ament_cmake_uncrustify ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Implementation of phase-sequence tasks for the Robotics Middleware Framework";
  };
}
