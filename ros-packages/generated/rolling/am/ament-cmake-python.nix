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
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_python";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_python" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_python-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "a85c0a6a07b9865a9e44d7b4591a8526fd7da1e4";
        hash = "sha256-gdKqwz9sEYdwLgdnVWMdAPHp0UHsAnyGgtIXAxDL6lk=";
      };
    };
  });
  meta = {
    description = "The ability to use Python in the ament buildsystem in CMake.";
  };
})
