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
  version = "2.8.1-1";
  src = finalAttrs.passthru.sources."ament_cmake_vendor_package";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" "python3-vcstool" ]; };
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" "python3-vcstool" ]; };
  checkInputs = [ ament-cmake-test ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_vendor_package" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_vendor_package-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "8516e6bb367e74aba41be631c337b60447127343";
        hash = "sha256-nxhDaTrHEDYuB1BsBJvJEGZCRy2nIM3H1NKqo5RxXdw=";
      };
    };
  });
  meta = {
    description = "Macros for maintaining a 'vendor' package.";
  };
})
