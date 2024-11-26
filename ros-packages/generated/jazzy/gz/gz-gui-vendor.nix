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
  gz-msgs-vendor,
  gz-plugin-vendor,
  gz-rendering-vendor,
  gz-tools-vendor,
  gz-transport-vendor,
  gz-utils-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_gui_vendor";
  version = "0.0.4-1";
  src = finalAttrs.passthru.sources."gz_gui_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gz-cmake-vendor ];
  propagatedBuildInputs = [ gz-common-vendor gz-math-vendor gz-msgs-vendor gz-plugin-vendor gz-rendering-vendor gz-tools-vendor gz-transport-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-gui8" "libqt5-core" "libqt5-qml" "libqt5-quick" "libqt5-widgets" "protobuf-dev" "qml-module-qt-labs-folderlistmodel" "qml-module-qt-labs-platform" "qml-module-qt-labs-settings" "qml-module-qtcharts" "qml-module-qtgraphicaleffects" "qml-module-qtlocation" "qml-module-qtpositioning" "qml-module-qtquick-controls" "qml-module-qtquick-controls2" "qml-module-qtquick-dialogs" "qml-module-qtquick-extras" "qml-module-qtquick-layouts" "qml-module-qtquick-templates2" "qml-module-qtquick-window2" "qml-module-qtquick2" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "xvfb" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gz_gui_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_gui_vendor-source";
        url = "https://github.com/ros2-gbp/gz_gui_vendor-release.git";
        rev = "4c659061263669413bb9e9eccbd9cf78c5ec4b23";
        hash = "sha256-RYzhgBv6G6dkS2Fi72k1rHH0HrgKc7MQy6MaVF9+2qg=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_gui_vendor/gz-gui"}";
        }
      ];
    };
    "gz_gui_vendor/gz-gui" = substituteSource {
      src = fetchgit {
        name = "gz-gui-source";
        url = "https://github.com/gazebosim/gz-gui.git";
        rev = "036df090d5fb9323617ad186156e295a85e38421";
        hash = "sha256-V0zaL6qrd510hMECCr3/mMkyqf4yu2aaKLRZ6Rw0s/4=";
      };
    };
  });
  meta = {
    description = "Vendor package for: gz-gui8 8.3.0 Gazebo GUI : Graphical interfaces for robotics applications";
  };
})
