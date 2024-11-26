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
  version = "2.6.0-1";
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
          rev = "df2036e77df3547d8bb9f5d80b23c0cb12c48d25";
          hash = "sha256-KAVo9k6pT8cr4ouHJLklaxOEkLl6sZM9+9pSSOTBs+c=";
        };
      };
    });
  };
  meta = {
    description = "Package for managing tasks in the Robotics Middleware Framework";
  };
})
