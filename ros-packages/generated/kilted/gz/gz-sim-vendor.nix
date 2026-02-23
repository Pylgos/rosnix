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
  gz-fuel-tools-vendor,
  gz-gui-vendor,
  gz-math-vendor,
  gz-msgs-vendor,
  gz-physics-vendor,
  gz-plugin-vendor,
  gz-rendering-vendor,
  gz-sensors-vendor,
  gz-tools-vendor,
  gz-transport-vendor,
  gz-utils-vendor,
  mkSourceSet,
  rosSystemPackages,
  sdformat-vendor,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_sim_vendor";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."gz_sim_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-fuel-tools-vendor gz-gui-vendor gz-math-vendor gz-msgs-vendor gz-physics-vendor gz-plugin-vendor gz-rendering-vendor gz-sensors-vendor gz-tools-vendor gz-transport-vendor gz-utils-vendor sdformat-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "benchmark" "glut" "gz-sim9" "libfreeimage-dev" "libglew-dev" "libxi-dev" "libxmu-dev" "protobuf-dev" "pybind11-dev" "qml-module-qt-labs-folderlistmodel" "qml-module-qt-labs-settings" "qml-module-qtgraphicaleffects" "qml-module-qtquick-controls" "qml-module-qtquick-controls2" "qml-module-qtquick-dialogs" "qml-module-qtquick-layouts" "qml-module-qtquick2" "qtbase5-dev" "qtdeclarative5-dev" "tinyxml2" "uuid" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-fuel-tools-vendor gz-gui-vendor gz-math-vendor gz-msgs-vendor gz-physics-vendor gz-plugin-vendor gz-rendering-vendor gz-sensors-vendor gz-tools-vendor gz-transport-vendor gz-utils-vendor sdformat-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" "glut" "gz-sim9" "libfreeimage-dev" "libglew-dev" "libxi-dev" "libxmu-dev" "protobuf-dev" "pybind11-dev" "qml-module-qt-labs-folderlistmodel" "qml-module-qt-labs-settings" "qml-module-qtgraphicaleffects" "qml-module-qtquick-controls" "qml-module-qtquick-controls2" "qml-module-qtquick-dialogs" "qml-module-qtquick-layouts" "qml-module-qtquick2" "qtbase5-dev" "qtdeclarative5-dev" "tinyxml2" "uuid" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "xvfb" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gz_sim_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_sim_vendor-source";
        url = "https://github.com/ros2-gbp/gz_sim_vendor-release.git";
        rev = "cd9fa247c7c39e9b32d759623b52f877cf7bbf5e";
        hash = "sha256-nPjOcgq6RcE5NMjC1E+gNJWtj01otnqGMzwgvHdVLUU=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_sim_vendor/gz-sim"}";
        }
      ];
    };
    "gz_sim_vendor/gz-sim" = substituteSource {
      src = fetchgit {
        name = "gz-sim-source";
        url = "https://github.com/gazebosim/gz-sim.git";
        rev = "daabfc8ebbf283fa14862385dd109c71e2c1715a";
        hash = "sha256-NN+7qh1JWA9R/MxFlB8U13IEAJNKIYxo5SdHEA5vvVM=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-sim9 9.5.0\n\n    Gazebo Sim : A Robotic Simulator\n  ";
  };
})
