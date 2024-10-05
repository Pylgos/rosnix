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
        rev = "63ebf9304161d4f6e825f4c7f187d1aa3faad325";
        hash = "sha256-VSb5c56y1Qh6bWn2Xg1tr6Fcslrr56pPN5k01OFxHe8=";
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
        rev = "1317511d365d1b2c312c86f9062b8a4b7bfdc132";
        hash = "sha256-En3V8i/Ie8+KnSHGlm9Bap7REdLhYBaVHVbOM+/Pzno=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "gz_launch_vendor";
  version = "0.0.4-1";
  src = finalAttrs.passthru.sources."gz_launch_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz-common-vendor gz-gui-vendor gz-math-vendor gz-msgs-vendor gz-plugin-vendor gz-sim-vendor gz-tools-vendor gz-transport-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "binutils" "gz-launch7" "libgflags-dev" "libwebsockets-dev" "libxi-dev" "libxmu-dev" "libyaml-dev" "tinyxml2" "uuid" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "xvfb" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Vendor package for: gz-launch7 7.1.0 Gazebo Launch : Run and manage programs and plugins";
  };
})
