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
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."gz_plugin_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-tools-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-plugin3" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-tools-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-plugin3" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_plugin_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_plugin_vendor-source";
        url = "https://github.com/ros2-gbp/gz_plugin_vendor-release.git";
        rev = "3a8a569d9af9584364c9bc01d9851a6e512552d3";
        hash = "sha256-xYBVdaYxD092WT/jqEKbGIn7gCTSWBJ/oDUah0ZVCn4=";
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
        rev = "4341e1bc4d5d5479048f3f7cf5e371f6cd182a08";
        hash = "sha256-3La9TqxljV1Lko6ju+b8CCspDbhXGPLOGMivqYElTXM=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-plugin3 3.1.0\n\n    Gazebo Plugin : Cross-platform C++ library for dynamically loading plugins.\n  ";
  };
})
