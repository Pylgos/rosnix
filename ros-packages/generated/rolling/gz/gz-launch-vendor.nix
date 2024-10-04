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
  gz-gui-vendor,
  gz-math-vendor,
  gz-msgs-vendor,
  gz-plugin-vendor,
  gz-sim-vendor,
  gz-tools-vendor,
  gz-transport-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "gz_launch_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_launch_vendor-source";
        url = "https://github.com/ros2-gbp/gz_launch_vendor-release.git";
        rev = "2e6cc4ef14a597efcdc2b6f54d5c94beacedc9e1";
        hash = "sha256-rebwHfjZR/baFkgs27dqOl59BHNC1zmo9+M6eAxgvXE=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_launch_vendor/gz-launch"}";
        }
      ];
    };
    "gz_launch_vendor/gz-launch" = substituteSource {
      src = fetchgit {
        name = "gz-launch-source";
        url = "https://github.com/gazebosim/gz-launch.git";
        rev = "dc94c9a7d1e4112962b7095ebce3e3cf9ed400bc";
        hash = "sha256-K2W2SSlhJvF9mxEMNa7tZa3/3/LIvxZMGeVb0Mi6Vso=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "gz_launch_vendor";
  version = "0.2.0-1";
  src = sources."gz_launch_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-gui-vendor gz-math-vendor gz-msgs-vendor gz-plugin-vendor gz-sim-vendor gz-tools-vendor gz-transport-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "binutils" "gz-launch8" "libgflags-dev" "libwebsockets-dev" "libxi-dev" "libxmu-dev" "libyaml-dev" "tinyxml2" "uuid" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "xvfb" ]; };
  meta = {
    description = "Vendor package for: gz-launch8 8.0.0 Gazebo Launch : Run and manage programs and plugins";
  };
}
