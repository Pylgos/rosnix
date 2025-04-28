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
  version = "2.5.4-1";
  src = finalAttrs.passthru.sources."ament_cmake_include_directories";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_include_directories" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_include_directories-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "109bc13b8b05b841fa385a0cf6fbf36ab8ef7f24";
        hash = "sha256-5XW1RlJYJ8+4XQwXkhLKlDKgUlIGLrGGrirbDb9c2PY=";
      };
    };
  });
  meta = {
    description = "The functionality to order include directories according to a chain of prefixes in the ament buildsystem in CMake.";
  };
})
