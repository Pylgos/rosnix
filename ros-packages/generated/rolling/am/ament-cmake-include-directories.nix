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
  pname = "ament_cmake_include_directories";
  version = "2.8.3-1";
  src = finalAttrs.passthru.sources."ament_cmake_include_directories";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_include_directories" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_include_directories-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "f7494b8d67fb62b33f06ab76094ee68f3d036a48";
        hash = "sha256-kuuVKxsm83Yi/tL470E+kD03r7IOfZubeSE3W1AH3zY=";
      };
    };
  });
  meta = {
    description = "The functionality to order include directories according to a chain of prefixes in the ament buildsystem in CMake.";
  };
})
