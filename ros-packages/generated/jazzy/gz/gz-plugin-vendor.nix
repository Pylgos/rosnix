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
  gz-tools-vendor,
  gz-utils-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_plugin_vendor";
  version = "0.0.5-1";
  src = finalAttrs.passthru.sources."gz_plugin_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor ];
  propagatedBuildInputs = [ gz-tools-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-plugin2" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_plugin_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_plugin_vendor-source";
        url = "https://github.com/ros2-gbp/gz_plugin_vendor-release.git";
        rev = "caae49679d3f85864c73f7818e72fffd4d0a5d95";
        hash = "sha256-BCggAfdLy8L0PluvMhL7nx1s+99cg+syDgSGR7m8v6k=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_plugin_vendor/gz-plugin"}";
        }
      ];
    };
    "gz_plugin_vendor/gz-plugin" = substituteSource {
      src = fetchgit {
        name = "gz-plugin-source";
        url = "https://github.com/gazebosim/gz-plugin.git";
        rev = "4fc5ab140242f3126aeb4e2e6fb578d36e04a80f";
        hash = "sha256-iL4+EdFFAU55FVqE/CvyTv1zNaXxBWqWx44L0BeG2MU=";
      };
    };
  });
  meta = {
    description = "Vendor package for: gz-plugin2 2.0.4 Gazebo Plugin : Cross-platform C++ library for dynamically loading plugins.";
  };
})
