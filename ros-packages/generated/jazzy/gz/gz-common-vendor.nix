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
  version = "0.0.8-1";
  src = finalAttrs.passthru.sources."gz_common_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "pkg-config" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor ];
  propagatedBuildInputs = [ gz-math-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg-dev" "gz-common5" "libfreeimage-dev" "libgdal-dev" "libgts" "tinyxml2" "uuid" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_common_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_common_vendor-source";
        url = "https://github.com/ros2-gbp/gz_common_vendor-release.git";
        rev = "551cc65ff7c5d33d1b464aff889030aedd31379f";
        hash = "sha256-irOykRTguqDknCgFu8M9l18Sbaoir2qBE6wot5JxKlQ=";
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
        rev = "9d775ab82cf8284d9078e0b1b58e22b87c177e61";
        hash = "sha256-vNCjCSQYCSUHXKwXnq8vwWXiSK2+cD3yPSLT1FdAWrE=";
      };
    };
  });
  meta = {
    description = "Vendor package for: gz-common5 5.7.1 Gazebo Common : AV, Graphics, Events, and much more.";
  };
})
