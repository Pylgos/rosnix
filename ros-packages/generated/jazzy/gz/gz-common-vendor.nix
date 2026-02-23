{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cmake-vendor-package,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-cmake-vendor,
  gz-math-vendor,
  gz-utils-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_common_vendor";
  version = "0.0.9-1";
  src = finalAttrs.passthru.sources."gz_common_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "pkg-config" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp-dev" "ffmpeg-dev" "gz-common5" "libfreeimage-dev" "libgdal-dev" "libgts" "tinyxml2" "uuid" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" "pkg-config" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg-dev" "gz-common5" "libfreeimage-dev" "libgdal-dev" "libgts" "tinyxml2" "uuid" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_common_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_common_vendor-source";
        url = "https://github.com/ros2-gbp/gz_common_vendor-release.git";
        rev = "30beadfaf5f7124579e9848f1a227f19d603b9a1";
        hash = "sha256-nvQpLaW+iwhlckrlDBtq6ogDjeikEwW52ZXw4M3rqSA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_common_vendor/gz-common"}";
        }
      ];
    };
    "gz_common_vendor/gz-common" = substituteSource {
      src = fetchgit {
        name = "gz-common-source";
        url = "https://github.com/gazebosim/gz-common.git";
        rev = "15de7e6dbea90f5b19a0e70ce4704183e17fb6b7";
        hash = "sha256-KYJgyP7aPCNBNCV1sZmVPY7US39dXZDw5b9TVG6i7T8=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-common5 5.8.0\n\n    Gazebo Common : AV, Graphics, Events, and much more.\n  ";
  };
})
