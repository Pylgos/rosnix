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
  version = "2.7.0-2";
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
        rev = "90658a3d07a54434b82ea9768e8cdb4015dc7a5d";
        hash = "sha256-8A4VJ3mW2SsrbHK1qknhU/mjsWoZLA8+tK4yJOsX0dc=";
      };
    };
  });
  meta = {
    description = "Implementation of phase-sequence tasks for the Robotics Middleware Framework";
  };
})
