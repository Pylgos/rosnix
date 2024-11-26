{
  ament-cmake-catch2,
  ament-cmake-uncrustify,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nlohmann-json-schema-validator-vendor,
  rmf-api-msgs,
  rmf-task,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "rmf_task_sequence";
  version = "2.6.0-1";
  src = finalAttrs.passthru.sources."rmf_task_sequence";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ nlohmann-json-schema-validator-vendor rmf-api-msgs rmf-task ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_task_sequence" = substituteSource {
      src = fetchgit {
        name = "rmf_task_sequence-source";
        url = "https://github.com/ros2-gbp/rmf_task-release.git";
        rev = "59ff2883fb336b1d94a155b748e49598b5cd714c";
        hash = "sha256-ycFUnXqF4y3xtgkhD0YLyx6TLNrpYYsNQbNk9+H+ZkM=";
      };
    };
  });
  meta = {
    description = "Implementation of phase-sequence tasks for the Robotics Middleware Framework";
  };
})
