{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-vendor-package,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_assimp_vendor";
  version = "15.0.12-1";
  src = finalAttrs.passthru.sources."rviz_assimp_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "assimp" ]; };
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_assimp_vendor" = substituteSource {
      src = fetchgit {
        name = "rviz_assimp_vendor-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "76d63c409871a445ab2816f2d292030c23094ea5";
        hash = "sha256-Nl+MiZLqAOAVespVuDgDutFaLvGCU5NIJXSwbKyW1Ng=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/assimp/assimp.git";
          to = "VCS_TYPE path VCS_URL ${sources."rviz_assimp_vendor/assimp"}";
        }
      ];
    };
    "rviz_assimp_vendor/assimp" = substituteSource {
      src = fetchgit {
        name = "assimp-source";
        url = "https://github.com/assimp/assimp.git";
        rev = "6a08c39e3a91ef385e76515cfad86aca4bfd57ff";
        hash = "sha256-ResIn+TA/FvrFt5+svMyLCJb2e+lyHFWopHBuzoXAhQ=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around assimp, providing nothing but a dependency on assimp, on some systems.\n    On others, it provides a fixed CMake module or even an ExternalProject build of assimp.\n  ";
  };
})
