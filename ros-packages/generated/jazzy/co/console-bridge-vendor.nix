{
  ament-cmake,
  ament-cmake-vendor-package,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  performance-test-fixture,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "console_bridge_vendor";
  version = "1.7.1-3";
  src = finalAttrs.passthru.sources."console_bridge_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libconsole-bridge-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libconsole-bridge-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "console_bridge_vendor" = substituteSource {
      src = fetchgit {
        name = "console_bridge_vendor-source";
        url = "https://github.com/ros2-gbp/console_bridge_vendor-release.git";
        rev = "bb994f26fbd204276c099c630b9ee07e48e70026";
        hash = "sha256-+m52Ig9uULM+20Ouz1g69az+DbquL6j4S81kz7VOxD4=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/ros/console_bridge.git";
          to = "VCS_TYPE path VCS_URL ${sources."console_bridge_vendor/console_bridge"}";
        }
      ];
    };
    "console_bridge_vendor/console_bridge" = substituteSource {
      src = fetchgit {
        name = "console_bridge-source";
        url = "https://github.com/ros/console_bridge.git";
        rev = "0828d846f2d4940b4e2b5075c6c724991d0cd308";
        hash = "sha256-M3GocT0hodw3Sc2NHcFDiPVZ1XN7BqIUuYLW8OaXMqM=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around console_bridge, providing nothing but a dependency on console_bridge, on some systems.\n    On others, it provides an ExternalProject build of console_bridge.\n  ";
  };
})
