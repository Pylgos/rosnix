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
  version = "2.7.5-1";
  src = finalAttrs.passthru.sources."ament_cmake_pytest";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_pytest" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pytest-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "dd47c5ef3e1150e9e37079fea3dfe2d6b2feab1b";
        hash = "sha256-7sopRMs8C2fNXIaac3DLyXowZHt3VuIBuwSomF4mGvA=";
      };
    };
  });
  meta = {
    description = "The ability to run Python tests using pytest in the ament buildsystem in CMake.";
  };
})
