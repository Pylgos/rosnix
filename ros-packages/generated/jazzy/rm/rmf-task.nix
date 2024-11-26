{
  ament-cmake-catch2,
  ament-cmake-uncrustify,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmf-battery,
  rmf-utils,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "rmf_task";
  version = "2.5.1-1";
  src = finalAttrs.passthru.sources."rmf_task";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ rmf-battery rmf-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_task" = substituteSource {
        src = fetchgit {
          name = "rmf_task-source";
          url = "https://github.com/ros2-gbp/rmf_task-release.git";
          rev = "b42a6d47b406d4534212fd4bdce519fc6fc0ad7d";
          hash = "sha256-elrSBRSbYp9FkGt6dvo70RwbBEtr6WBTzywkr0W01uc=";
        };
      };
    });
  };
  meta = {
    description = "Package for managing tasks in the Robotics Middleware Framework";
  };
})
