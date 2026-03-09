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
  version = "2.8.6-1";
  src = finalAttrs.passthru.sources."ament_cmake_vendor_package";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" "python3-vcstool" ]; };
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" "python3-vcstool" ]; };
  checkInputs = [ ament-cmake-test ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_vendor_package" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_vendor_package-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "fb999b170b5304c3b3e266720b9fdc75916921c4";
        hash = "sha256-hX2dCYfDDyMO5UCT4GsB9BncmstsJw4wAFBrVbzx1Dg=";
      };
    };
  });
  meta = {
    description = "Macros for maintaining a 'vendor' package.";
  };
})
