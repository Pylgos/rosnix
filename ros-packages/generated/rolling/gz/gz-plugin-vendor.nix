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
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."gz_plugin_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-tools-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-plugin" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-tools-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-plugin" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_plugin_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_plugin_vendor-source";
        url = "https://github.com/ros2-gbp/gz_plugin_vendor-release.git";
        rev = "fed97be5687d0b90695c0bd0fc65aa1e8cd6d757";
        hash = "sha256-id97qCs7ycB/Wr1oTApwzBKlOb7bfAD3rLySRHfU8s8=";
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
        rev = "f8b4f327546c7b778cf7ff1e6aadcc7403b40155";
        hash = "sha256-/T0Gav0b9BG39qm8v8J7qnpYdLSwsRZVar4i5zUyF5M=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-plugin 4.0.0\n\n    Gazebo Plugin : Cross-platform C++ library for dynamically loading plugins.\n  ";
  };
})
