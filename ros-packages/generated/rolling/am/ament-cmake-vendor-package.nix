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
  version = "2.8.3-1";
  src = finalAttrs.passthru.sources."ament_cmake_vendor_package";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" "python3-vcstool" ]; };
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" "python3-vcstool" ]; };
  checkInputs = [ ament-cmake-test ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_vendor_package" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_vendor_package-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "e609e33ff451ed08996e6ed8e263a29d124afc7d";
        hash = "sha256-YfG88o8IK1Z4k3MiTfie2sBP3o8Sf8+S1bns7nhTABw=";
      };
    };
  });
  meta = {
    description = "Macros for maintaining a 'vendor' package.";
  };
})
