{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_python";
  version = "2.5.4-1";
  src = finalAttrs.passthru.sources."ament_cmake_python";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_python" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_python-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "bb2aa40dd0f0f3d615824507cd14d5ad5edb911e";
        hash = "sha256-0bW0IQsJKXTsn3oAPqdWrooLnF4uBAwUinNqlqEXfbo=";
      };
    };
  });
  meta = {
    description = "The ability to use Python in the ament buildsystem in CMake.";
  };
})
