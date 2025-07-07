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
  version = "1.9.1-1";
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
        rev = "fc7fd34a15338c36da5d20e5897af6df2efed35d";
        hash = "sha256-vrAC1/YLl/S1rnAhapp3GonPLHO+2CfXBWXYpkDMjKs=";
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
        rev = "81ec67f6daf3cd19ef506e00f02efb1645597b9c";
        hash = "sha256-Se8w+4XIEuWhJDk4Xy4RbfFtGcnXrurzwmcr1kuA/to=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around console_bridge, providing nothing but a dependency on console_bridge, on some systems.\n    On others, it provides an ExternalProject build of console_bridge.\n  ";
  };
})
