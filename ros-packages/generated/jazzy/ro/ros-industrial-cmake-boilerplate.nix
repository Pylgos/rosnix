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
  version = "0.5.4-3";
  src = finalAttrs.passthru.sources."ros_industrial_cmake_boilerplate";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cppcheck" "gtest" "iwyu" "lcov" "libclang-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros_industrial_cmake_boilerplate" = substituteSource {
      src = fetchgit {
        name = "ros_industrial_cmake_boilerplate-source";
        url = "https://github.com/ros2-gbp/ros_industrial_cmake_boilerplate-release.git";
        rev = "09c03bebd52e95c6f5f92dc7dbe5071039b220fd";
        hash = "sha256-yxsr0rMyvBYeoeMkhnWs1wSUR+qmZ66S/z9WOpMtRwk=";
      };
    };
  });
  meta = {
    description = "Contains boilerplate cmake script, macros and utils";
  };
})
