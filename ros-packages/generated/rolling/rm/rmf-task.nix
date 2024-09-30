{
  ament-cmake-catch2,
  ament-cmake-uncrustify,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmf-battery,
  rmf-utils,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rmf_task" = substituteSource {
      src = fetchgit {
        name = "rmf_task-source";
        url = "https://github.com/ros2-gbp/rmf_task-release.git";
        rev = "df2036e77df3547d8bb9f5d80b23c0cb12c48d25";
        hash = "sha256-KAVo9k6pT8cr4ouHJLklaxOEkLl6sZM9+9pSSOTBs+c=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rmf_task";
  version = "2.6.0-1";
  src = sources."rmf_task";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rmf-battery rmf-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package for managing tasks in the Robotics Middleware Framework";
  };
}
