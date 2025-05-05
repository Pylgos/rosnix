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
  version = "0.2.1-1";
  src = finalAttrs.passthru.sources."gz_gui_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-math-vendor gz-msgs-vendor gz-plugin-vendor gz-rendering-vendor gz-tools-vendor gz-transport-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-gui9" "libqt5-core" "libqt5-qml" "libqt5-quick" "libqt5-widgets" "protobuf-dev" "qml-module-qt-labs-folderlistmodel" "qml-module-qt-labs-platform" "qml-module-qt-labs-settings" "qml-module-qtcharts" "qml-module-qtgraphicaleffects" "qml-module-qtlocation" "qml-module-qtpositioning" "qml-module-qtquick-controls" "qml-module-qtquick-controls2" "qml-module-qtquick-dialogs" "qml-module-qtquick-extras" "qml-module-qtquick-layouts" "qml-module-qtquick-templates2" "qml-module-qtquick-window2" "qml-module-qtquick2" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "tinyxml2" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-math-vendor gz-msgs-vendor gz-plugin-vendor gz-rendering-vendor gz-tools-vendor gz-transport-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-gui9" "libqt5-core" "libqt5-qml" "libqt5-quick" "libqt5-widgets" "protobuf-dev" "qml-module-qt-labs-folderlistmodel" "qml-module-qt-labs-platform" "qml-module-qt-labs-settings" "qml-module-qtcharts" "qml-module-qtgraphicaleffects" "qml-module-qtlocation" "qml-module-qtpositioning" "qml-module-qtquick-controls" "qml-module-qtquick-controls2" "qml-module-qtquick-dialogs" "qml-module-qtquick-extras" "qml-module-qtquick-layouts" "qml-module-qtquick-templates2" "qml-module-qtquick-window2" "qml-module-qtquick2" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "xvfb" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gz_gui_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_gui_vendor-source";
        url = "https://github.com/ros2-gbp/gz_gui_vendor-release.git";
        rev = "dea965b6f273536da1e48414be2aaa7d3e1d2f80";
        hash = "sha256-ptyL5Z2UZ7jXIku8SO8xAZ564nJ1mq0eUcFVZ+KNdAY=";
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
        rev = "db69c56f4be1bc8ee8427c283f6f4cb8799962da";
        hash = "sha256-ZBDgd37TPBOldorGZimsCk57fVa7tTc8wRwUGFBZnDk=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-gui9 9.0.1\n\n    Gazebo GUI : Graphical interfaces for robotics applications\n  ";
  };
})
