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
  version = "2.5.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_libraries";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_libraries" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_libraries-source";
          url = "https://github.com/ros2-gbp/ament_cmake-release.git";
          rev = "4f19452769a2137a73e98f1af2a4da29d907fbd3";
          hash = "sha256-qPsh1jLploxTcx7YSm921jfl/hTLS7rfyYoeg8VB8g4=";
        };
      };
    });
  };
  meta = {
    description = "The functionality to deduplicate libraries in the ament buildsystem in CMake.";
  };
})
