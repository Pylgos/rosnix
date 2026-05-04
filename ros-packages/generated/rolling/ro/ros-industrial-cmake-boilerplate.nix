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
  version = "0.5.4-2";
  src = finalAttrs.passthru.sources."ros_industrial_cmake_boilerplate";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cppcheck" "gtest" "iwyu" "lcov" "libclang-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros_industrial_cmake_boilerplate" = substituteSource {
      src = fetchgit {
        name = "ros_industrial_cmake_boilerplate-source";
        url = "https://github.com/ros2-gbp/ros_industrial_cmake_boilerplate-release.git";
        rev = "e4682a9e00ac25aba31642185772d9e39940ec24";
        hash = "sha256-NNFU5mlJOArL1iPf5H+BIxRINXHrFKuxWGRSwuoG8HM=";
      };
    };
  });
  meta = {
    description = "Contains boilerplate cmake script, macros and utils";
  };
})
