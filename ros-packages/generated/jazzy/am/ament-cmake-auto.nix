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
  version = "2.5.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_auto";
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ];
  propagatedBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_auto" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_auto-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "21cd2df28c7b64e50e2f0064018b66283e507a3e";
        hash = "sha256-J1If3cVNRWqrWW421Z2KTDE+gW7Pv1WE7XveHX1N9XE=";
      };
    };
  });
  meta = {
    description = "The auto-magic functions for ease to use of the ament buildsystem in CMake.";
  };
})
