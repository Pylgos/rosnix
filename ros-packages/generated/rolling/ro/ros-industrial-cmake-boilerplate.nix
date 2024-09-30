{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ros_industrial_cmake_boilerplate" = substituteSource {
      src = fetchgit {
        name = "ros_industrial_cmake_boilerplate-source";
        url = "https://github.com/ros2-gbp/ros_industrial_cmake_boilerplate-release.git";
        rev = "955034a0e53d423d818c9d966f88ea1e002e06d3";
        hash = "sha256-yxsr0rMyvBYeoeMkhnWs1wSUR+qmZ66S/z9WOpMtRwk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ros_industrial_cmake_boilerplate";
  version = "0.5.4-1";
  src = sources."ros_industrial_cmake_boilerplate";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cppcheck" "gtest" "iwyu" "lcov" "libclang-dev" ]; };
  meta = {
    description = "Contains boilerplate cmake script, macros and utils";
  };
}
