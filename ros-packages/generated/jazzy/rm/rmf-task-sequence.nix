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
  version = "2.5.1-1";
  src = finalAttrs.passthru.sources."rmf_task_sequence";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ nlohmann-json-schema-validator-vendor rmf-api-msgs rmf-task ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "nlohmann-json-dev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ nlohmann-json-schema-validator-vendor rmf-api-msgs rmf-task ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_task_sequence" = substituteSource {
      src = fetchgit {
        name = "rmf_task_sequence-source";
        url = "https://github.com/ros2-gbp/rmf_task-release.git";
        rev = "d571a0315533786952852c1e372bb868a43bf059";
        hash = "sha256-9OH24N9NPVg+Uw3eMjJKKfPn7qJZJ3VjcAnc68hJ3Qc=";
      };
    };
  });
  meta = {
    description = "Implementation of phase-sequence tasks for the Robotics Middleware Framework";
  };
})
