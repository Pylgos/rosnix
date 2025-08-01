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
  version = "2.8.4-1";
  src = finalAttrs.passthru.sources."ament_cmake_pytest";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_pytest" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pytest-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "c253839eed412b8884ad0f9e259fbdf9bb901424";
        hash = "sha256-eWUJtsD1peKcVihzQnTYEpVy54XvlLJeJru1Q1RqUQo=";
      };
    };
  });
  meta = {
    description = "The ability to run Python tests using pytest in the ament buildsystem in CMake.";
  };
})
