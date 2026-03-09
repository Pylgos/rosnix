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
  version = "2.5.6-2";
  src = finalAttrs.passthru.sources."ament_cmake_pytest";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_pytest" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pytest-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "e1a5cdf326a0ccc4c66a8bdc667a8f11f9cdb9af";
        hash = "sha256-dniEM1yEhiGx9RiAKBGvJlj6f7HHbihlLEMf0Ey28tU=";
      };
    };
  });
  meta = {
    description = "The ability to run Python tests using pytest in the ament buildsystem in CMake.";
  };
})
