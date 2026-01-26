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
  version = "0.3.3-1";
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
        rev = "def206f04bd994aa41df513ed26d33e662bd6e4d";
        hash = "sha256-FQ1FPAmlRcKnZ/YyZUvbnzRkdz132OHfDKtPsFi9DU0=";
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
        rev = "00f5e0ead5d36317834aa209b4a8f3ecacad881d";
        hash = "sha256-ZH/VfJUjY70OkAC8+3nIOXvzbUYcO2OgMJo4HLnTs4A=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-common 7.0.1\n\n    Gazebo Common : AV, Graphics, Events, and much more.\n  ";
  };
})
