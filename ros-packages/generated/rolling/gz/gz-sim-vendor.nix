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
  version = "0.4.1-1";
  src = finalAttrs.passthru.sources."gz_sim_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-fuel-tools-vendor gz-gui-vendor gz-math-vendor gz-msgs-vendor gz-physics-vendor gz-plugin-vendor gz-rendering-vendor gz-sensors-vendor gz-tools-vendor gz-transport-vendor gz-utils-vendor sdformat-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "benchmark" "binutils" "glut" "gz-sim" "libdw-dev" "libdwarf-dev" "libfreeimage-dev" "libglew-dev" "libwebsockets-dev" "libxi-dev" "libxmu-dev" "protobuf-dev" "pybind11-dev" "qml6-module-qt-labs-folderlistmodel" "qml6-module-qt-labs-settings" "qml6-module-qt5compat-graphicaleffects" "qml6-module-qtquick" "qml6-module-qtquick-controls" "qml6-module-qtquick-dialogs" "qml6-module-qtquick-layouts" "qt6-5compat-dev" "qt6-base-dev" "qt6-base-private-dev" "qt6-declarative-dev" "tinyxml2" "uuid" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-fuel-tools-vendor gz-gui-vendor gz-math-vendor gz-msgs-vendor gz-physics-vendor gz-plugin-vendor gz-rendering-vendor gz-sensors-vendor gz-tools-vendor gz-transport-vendor gz-utils-vendor sdformat-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" "binutils" "glut" "gz-sim" "libdw-dev" "libdwarf-dev" "libfreeimage-dev" "libglew-dev" "libwebsockets-dev" "libxi-dev" "libxmu-dev" "protobuf-dev" "pybind11-dev" "qml6-module-qt-labs-folderlistmodel" "qml6-module-qt-labs-settings" "qml6-module-qt5compat-graphicaleffects" "qml6-module-qtquick" "qml6-module-qtquick-controls" "qml6-module-qtquick-dialogs" "qml6-module-qtquick-layouts" "qt6-5compat-dev" "qt6-base-dev" "qt6-base-private-dev" "qt6-declarative-dev" "tinyxml2" "uuid" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "xvfb" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gz_sim_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_sim_vendor-source";
        url = "https://github.com/ros2-gbp/gz_sim_vendor-release.git";
        rev = "25cd3acd615772bc4baf246908c36bef02de0f15";
        hash = "sha256-EA0tU1nQ1pQYc2TYCB8uKdw9Y9BLKkwRMKhQDcyruls=";
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
        rev = "019e38c12cfcf1843a5ee3afd6c3638cf9b2e420";
        hash = "sha256-D9gSD6a/c86K7s2bWRTMlvFCXXo/2m9c7iUub2nTxGk=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-sim 10.0.0\n\n    Gazebo Sim : A Robotic Simulator\n  ";
  };
})
