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
  version = "0.0.8-1";
  src = finalAttrs.passthru.sources."gz_sim_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pybind11-dev" ]; };
  propagatedBuildInputs = [ gz-common-vendor gz-fuel-tools-vendor gz-gui-vendor gz-math-vendor gz-msgs-vendor gz-physics-vendor gz-plugin-vendor gz-rendering-vendor gz-sensors-vendor gz-tools-vendor gz-transport-vendor gz-utils-vendor sdformat-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" "glut" "gz-sim8" "libfreeimage-dev" "libglew-dev" "libxi-dev" "libxmu-dev" "protobuf-dev" "qml-module-qt-labs-folderlistmodel" "qml-module-qt-labs-settings" "qml-module-qtgraphicaleffects" "qml-module-qtquick-controls" "qml-module-qtquick-controls2" "qml-module-qtquick-dialogs" "qml-module-qtquick-layouts" "qml-module-qtquick2" "qtbase5-dev" "qtdeclarative5-dev" "tinyxml2" "uuid" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "xvfb" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gz_sim_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_sim_vendor-source";
        url = "https://github.com/ros2-gbp/gz_sim_vendor-release.git";
        rev = "c70492cae31c0660bd2b8a40c71b4a4929357015";
        hash = "sha256-sv9sH9amOGuBzLmyxGiEcKIQjbByKMsI3V+ik7luqB0=";
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
        rev = "49670c95d2cab9e1c4f993fb675a31ca97452805";
        hash = "sha256-hvhq2XBzcIoupJdJyJzk38LDXoEnd9iBCCiXvPZsPqY=";
      };
    };
  });
  meta = {
    description = "Vendor package for: gz-sim8 8.9.0 Gazebo Sim : A Robotic Simulator";
  };
})
