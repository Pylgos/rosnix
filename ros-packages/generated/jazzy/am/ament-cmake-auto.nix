{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_auto";
  version = "2.5.4-1";
  src = finalAttrs.passthru.sources."ament_cmake_auto";
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ];
  propagatedBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_auto" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_auto-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "e929f0f6fdf19f76885853c65df69d5e70fb81f9";
        hash = "sha256-NVreeay/SE6gXrKNuPXop7RyWNSutC9YCiRvdamFETk=";
      };
    };
  });
  meta = {
    description = "The auto-magic functions for ease to use of the ament buildsystem in CMake.";
  };
})
