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
  version = "0.3.4-1";
  src = finalAttrs.passthru.sources."gz_common_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "pkg-config" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-utils-vendor spdlog-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp-dev" "ffmpeg-dev" "gz-common" "libfreeimage-dev" "libgdal-dev" "tinyxml2" "uuid" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" "pkg-config" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-utils-vendor spdlog-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg-dev" "gz-common" "libfreeimage-dev" "libgdal-dev" "tinyxml2" "uuid" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_common_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_common_vendor-source";
        url = "https://github.com/ros2-gbp/gz_common_vendor-release.git";
        rev = "3fc8ea3add52248accc0321ddf2f6b2f93d9f44c";
        hash = "sha256-E/104xiHJwOVaD9Lbbj0iIAniLX/q6goJjDeXY6XdP8=";
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
    description = "\n    Vendor package for: gz-common 7.1.0\n\n    Gazebo Common : AV, Graphics, Events, and much more.\n  ";
  };
})
