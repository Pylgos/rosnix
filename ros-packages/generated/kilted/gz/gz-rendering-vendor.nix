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
  version = "0.2.6-1";
  src = finalAttrs.passthru.sources."gz_rendering_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-math-vendor gz-ogre-next-vendor gz-plugin-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "glut" "gz-rendering9" "libfreeimage-dev" "libglew-dev" "libogre-dev" "libvulkan-dev" "libxi-dev" "libxmu-dev" "uuid" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-math-vendor gz-ogre-next-vendor gz-plugin-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "glut" "gz-rendering9" "libfreeimage-dev" "libglew-dev" "libogre-dev" "libvulkan-dev" "libxi-dev" "libxmu-dev" "uuid" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "xvfb" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gz_rendering_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_rendering_vendor-source";
        url = "https://github.com/ros2-gbp/gz_rendering_vendor-release.git";
        rev = "965fe61b6683310f0b6cf179dd732294c96c2c29";
        hash = "sha256-lDEBGVgq4gNASgi6QAX/CcGLOjJc8+Tm6mNRLpycT24=";
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
        rev = "7dc163b6efc81c86a14451f6411592e2bd34aa4d";
        hash = "sha256-cnCTk7didt+T7WEz/eRAZfVETtHVpHqWXhOYZ1iwBfE=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-rendering9 9.5.0\n\n    Gazebo Rendering: Rendering library for robot applications\n  ";
  };
})
