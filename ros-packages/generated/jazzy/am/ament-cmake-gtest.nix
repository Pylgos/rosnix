{
  ament-cmake-core,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_gtest";
  version = "2.5.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_gtest";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test gtest-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gtest" ]; };
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test gtest-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_gtest" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gtest-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "2aa26a6e2e6a4eb883f364352230e156655a9414";
        hash = "sha256-YciA2zVQz/s8E5H9riC/gXb6pQGowQ9dbPIxQxhqACk=";
      };
    };
  });
  meta = {
    description = "The ability to add gtest-based tests in the ament buildsystem in CMake.";
  };
})
