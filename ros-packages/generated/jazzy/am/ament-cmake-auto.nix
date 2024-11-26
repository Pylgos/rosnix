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
  version = "2.5.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_auto";
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ];
  propagatedBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_auto" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_auto-source";
          url = "https://github.com/ros2-gbp/ament_cmake-release.git";
          rev = "7181c7fb46a89e026993ea016ab54889b3cdcc75";
          hash = "sha256-J1If3cVNRWqrWW421Z2KTDE+gW7Pv1WE7XveHX1N9XE=";
        };
      };
    });
  };
  meta = {
    description = "The auto-magic functions for ease to use of the ament buildsystem in CMake.";
  };
})
