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
  version = "2.5.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_vendor_package";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-vcstool" ]; };
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-vcstool" ]; };
  checkInputs = [ ament-cmake-test ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_vendor_package" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_vendor_package-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "97482c1209ed7cf762456a67198edcbfe360e6ea";
        hash = "sha256-KkTE1QQazWtE0GfTss356rNFZaYbrqRkSkq8CMhAeU8=";
      };
    };
  });
  meta = {
    description = "Macros for maintaining a 'vendor' package.";
  };
})
