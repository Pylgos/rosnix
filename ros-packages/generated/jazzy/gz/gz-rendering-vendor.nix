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
let
  sources = mkSourceSet (sources: {
    "gz_rendering_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_rendering_vendor-source";
        url = "https://github.com/ros2-gbp/gz_rendering_vendor-release.git";
        rev = "0311a31fd962c26af668bc0d1cc83e9aa3d32417";
        hash = "sha256-HfhzPI6ahnABY8PpXwl6szZ4P7VGjjGp1X2+KkbdTEc=";
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
        rev = "8a547d5386a33789313abbb5bbbe1b2ec4c04741";
        hash = "sha256-eaWkZKHu566Rub7YSO2lnKdj8YQbhl86v+JR4zrgtjs=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_rendering_vendor";
  version = "0.0.4-1";
  src = finalAttrs.passthru.sources."gz_rendering_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz-common-vendor gz-math-vendor gz-ogre-next-vendor gz-plugin-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "glut" "gz-rendering8" "libfreeimage-dev" "libglew-dev" "libogre-dev" "libvulkan-dev" "libxi-dev" "libxmu-dev" "uuid" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "xvfb" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Vendor package for: gz-rendering8 8.2.0 Gazebo Rendering: Rendering library for robot applications";
  };
})
