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
  version = "0.0.7-1";
  src = finalAttrs.passthru.sources."gz_common_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "pkg-config" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor ];
  propagatedBuildInputs = [ gz-math-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg-dev" "gz-common5" "libfreeimage-dev" "libgdal-dev" "libgts" "tinyxml2" "uuid" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru = {
    sources = mkSourceSet (sources: {
      "gz_common_vendor" = substituteSource {
        src = fetchgit {
          name = "gz_common_vendor-source";
          url = "https://github.com/ros2-gbp/gz_common_vendor-release.git";
          rev = "c7834c5ff9baeab7b24001a8f8d4b26080184ceb";
          hash = "sha256-75feNAC9KKmPtcunxhc3sRPH3hZi3OTL2YtAbAJDnvo=";
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
          rev = "12aec5b37658f8f41dc67e33a8ece7bf977a0e93";
          hash = "sha256-RBu49rxjzo4mc7ma4WpabUxUT7cvabJRinR98it10r4=";
        };
      };
    });
  };
  meta = {
    description = "Vendor package for: gz-common5 5.7.0 Gazebo Common : AV, Graphics, Events, and much more.";
  };
})
