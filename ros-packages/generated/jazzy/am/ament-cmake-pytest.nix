{
  ament-cmake-core,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_pytest";
  version = "2.5.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_pytest";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_pytest" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_pytest-source";
          url = "https://github.com/ros2-gbp/ament_cmake-release.git";
          rev = "fc58ed5a63f318a04230054b00827529e7bd2666";
          hash = "sha256-EvqH8/HvE1+IJq3aMPtqxAAhZ2i80nVL92brdBZ9OlA=";
        };
      };
    });
  };
  meta = {
    description = "The ability to run Python tests using pytest in the ament buildsystem in CMake.";
  };
})
