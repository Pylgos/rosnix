{
  ament-cmake-core,
  ament-cmake-export-dependencies,
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
  pname = "ament_cmake_vendor_package";
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_vendor_package";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" "python3-vcstool" ]; };
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" "python3-vcstool" ]; };
  checkInputs = [ ament-cmake-test ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_vendor_package" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_vendor_package-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "7cd6642c624996b70373f91314ab5c2c583c665b";
        hash = "sha256-EdxYGCS2LGi3mx7uF1xfx5pDx00d1MBw7RGIjttGrW0=";
      };
    };
  });
  meta = {
    description = "Macros for maintaining a 'vendor' package.";
  };
})
