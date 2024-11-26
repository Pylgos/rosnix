{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "ros_industrial_cmake_boilerplate";
  version = "0.5.4-1";
  src = finalAttrs.passthru.sources."ros_industrial_cmake_boilerplate";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cppcheck" "gtest" "iwyu" "lcov" "libclang-dev" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ros_industrial_cmake_boilerplate" = substituteSource {
        src = fetchgit {
          name = "ros_industrial_cmake_boilerplate-source";
          url = "https://github.com/ros2-gbp/ros_industrial_cmake_boilerplate-release.git";
          rev = "955034a0e53d423d818c9d966f88ea1e002e06d3";
          hash = "sha256-yxsr0rMyvBYeoeMkhnWs1wSUR+qmZ66S/z9WOpMtRwk=";
        };
      };
    });
  };
  meta = {
    description = "Contains boilerplate cmake script, macros and utils";
  };
})
