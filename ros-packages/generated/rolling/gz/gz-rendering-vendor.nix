{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cmake-vendor-package,
  ament-cmake-xmllint,
  buildRosPackage,
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
        rev = "a033c34e67f2ebdbd692fb2b8a1a4140acade567";
        hash = "sha256-ttaU1/Q6/g1NSJlyAAt9ez77iHFKkZJNnngU6zI3YaQ=";
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
buildRosPackage {
  pname = "gz_rendering_vendor";
  version = "0.1.1-1";
  src = sources."gz_rendering_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-math-vendor gz-ogre-next-vendor gz-plugin-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "glut" "gz-rendering8" "libfreeimage-dev" "libglew-dev" "libogre-dev" "libvulkan-dev" "libxi-dev" "libxmu-dev" "uuid" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "xvfb" ]; };
  meta = {
    description = "Vendor package for: gz-rendering8 8.2.0 Gazebo Rendering: Rendering library for robot applications";
  };
}
