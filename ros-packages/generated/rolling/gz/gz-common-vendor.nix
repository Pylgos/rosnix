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
  spdlog-vendor,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_common_vendor";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."gz_common_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "pkg-config" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-utils-vendor spdlog-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp-dev" "ffmpeg-dev" "gz-common6" "libfreeimage-dev" "libgdal-dev" "tinyxml2" "uuid" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" "pkg-config" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-utils-vendor spdlog-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg-dev" "gz-common6" "libfreeimage-dev" "libgdal-dev" "tinyxml2" "uuid" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_common_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_common_vendor-source";
        url = "https://github.com/ros2-gbp/gz_common_vendor-release.git";
        rev = "6bf183be64781d8a186be3e4a43e7c6b6a34129e";
        hash = "sha256-JSXuJ1LCepTETsUpaE+DVPDrF4ivCgAhFaQW/zOHv/E=";
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
        rev = "86b3b3dd57773a2bf7dbe8bae07bd92beb03f8f6";
        hash = "sha256-sY9g+AatS+ddYSUAjqumfZNi2JIc+DFbiVYMaWKMC78=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-common6 6.0.2\n\n    Gazebo Common : AV, Graphics, Events, and much more.\n  ";
  };
})
