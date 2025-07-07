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
  version = "2.8.4-1";
  src = finalAttrs.passthru.sources."ament_cmake_python";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_python" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_python-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "9b31e1b4cdf2564017f99be73a39ace552ffe917";
        hash = "sha256-ZVxTwD5XQ51oeAVLjgJuh5lbtYq7vT+V/0+Z7J8RvzY=";
      };
    };
  });
  meta = {
    description = "The ability to use Python in the ament buildsystem in CMake.";
  };
})
