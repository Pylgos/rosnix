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
  pname = "ament_cmake_libraries";
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_libraries";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_libraries" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_libraries-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "a2de2fe164e1c58f4871852bd7351232205d1727";
        hash = "sha256-ff+QzpaIDoCMl8zisaptIho3OJMDiEBa9rl2S6OQfMA=";
      };
    };
  });
  meta = {
    description = "The functionality to deduplicate libraries in the ament buildsystem in CMake.";
  };
})
