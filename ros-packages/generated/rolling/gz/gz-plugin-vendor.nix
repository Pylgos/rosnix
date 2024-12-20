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
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."gz_plugin_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = [ gz-cmake-vendor ];
  propagatedBuildInputs = [ gz-tools-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-plugin3" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_plugin_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_plugin_vendor-source";
        url = "https://github.com/ros2-gbp/gz_plugin_vendor-release.git";
        rev = "183bc4d418ef0c2b0cecaa888ce7fadf40a5533a";
        hash = "sha256-prFCEjcqpFU4tJKND9ce4tM+ZSGHBZwryNtIMUxhNCo=";
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
        rev = "faaf65e805cca46b4539e1941266189beb6b0bae";
        hash = "sha256-h2Dx0KcFmJlS67q0v1zbd9nQkTCKgHkxt5KKTT5v+fw=";
      };
    };
  });
  meta = {
    description = "Vendor package for: gz-plugin3 3.0.0 Gazebo Plugin : Cross-platform C++ library for dynamically loading plugins.";
  };
})
