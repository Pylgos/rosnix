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
  gz-common-vendor,
  gz-math-vendor,
  gz-ogre-next-vendor,
  gz-plugin-vendor,
  gz-utils-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_rendering_vendor";
  version = "0.0.5-1";
  src = finalAttrs.passthru.sources."gz_rendering_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = [ gz-cmake-vendor ];
  propagatedBuildInputs = [ gz-common-vendor gz-math-vendor gz-ogre-next-vendor gz-plugin-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "glut" "gz-rendering8" "libfreeimage-dev" "libglew-dev" "libogre-dev" "libvulkan-dev" "libxi-dev" "libxmu-dev" "uuid" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "xvfb" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gz_rendering_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_rendering_vendor-source";
        url = "https://github.com/ros2-gbp/gz_rendering_vendor-release.git";
        rev = "50d1833d1859876a79ddf2ae91b0aa6850dc3d30";
        hash = "sha256-bqebULbzJZ8g6XH+SgQ0NnBvF6dn2cHzGYqo3DpiwtE=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_rendering_vendor/gz-rendering"}";
        }
      ];
    };
    "gz_rendering_vendor/gz-rendering" = substituteSource {
      src = fetchgit {
        name = "gz-rendering-source";
        url = "https://github.com/gazebosim/gz-rendering.git";
        rev = "c28c1cc00a1c14f6c6980ca7ad8f27301c756598";
        hash = "sha256-ZHeEC/zvBKROJ/e+6Bdvhut30crhlC5VMsxrpIGIA0M=";
      };
    };
  });
  meta = {
    description = "Vendor package for: gz-rendering8 8.2.1 Gazebo Rendering: Rendering library for robot applications";
  };
})
