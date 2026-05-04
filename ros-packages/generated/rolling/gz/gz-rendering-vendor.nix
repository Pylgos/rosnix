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
  version = "0.4.3-2";
  src = finalAttrs.passthru.sources."gz_rendering_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-math-vendor gz-ogre-next-vendor gz-plugin-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "glut" "gz-rendering" "libfreeimage-dev" "libglew-dev" "libogre-dev" "libvulkan-dev" "libxi-dev" "libxmu-dev" "uuid" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-math-vendor gz-ogre-next-vendor gz-plugin-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "glut" "gz-rendering" "libfreeimage-dev" "libglew-dev" "libogre-dev" "libvulkan-dev" "libxi-dev" "libxmu-dev" "uuid" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "xvfb" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gz_rendering_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_rendering_vendor-source";
        url = "https://github.com/ros2-gbp/gz_rendering_vendor-release.git";
        rev = "755d61f23391c67bf02209cdbb8aac0f1873c093";
        hash = "sha256-dUUpTLI/3GAMvJpcqcBWvgQiSr3TS/YyV/Eyl292NPc=";
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
        rev = "c2c809fae72994da8176af70a81085223b7b8cfb";
        hash = "sha256-gnNGe/yk+ucwPviaa6FusLD9Kp3SXKhnAChyNQhRzrM=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-rendering 10.0.1\n\n    Gazebo Rendering: Rendering library for robot applications\n  ";
  };
})
