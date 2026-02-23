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
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."gz_gui_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-math-vendor gz-msgs-vendor gz-plugin-vendor gz-rendering-vendor gz-tools-vendor gz-transport-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-gui" "libqt6svg6" "protobuf-dev" "qml6-module-qt-labs-folderlistmodel" "qml6-module-qt-labs-platform" "qml6-module-qt-labs-settings" "qml6-module-qt5compat-graphicaleffects" "qml6-module-qtcharts" "qml6-module-qtcore" "qml6-module-qtpositioning" "qml6-module-qtqml" "qml6-module-qtqml-models" "qml6-module-qtqml-workerscript" "qml6-module-qtquick" "qml6-module-qtquick-controls" "qml6-module-qtquick-dialogs" "qml6-module-qtquick-layouts" "qml6-module-qtquick-templates" "qml6-module-qtquick-window" "qt6-5compat-dev" "qt6-base-dev" "qt6-base-private-dev" "qt6-declarative-dev" "qt6-declarative-private-dev" "tinyxml2" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-math-vendor gz-msgs-vendor gz-plugin-vendor gz-rendering-vendor gz-tools-vendor gz-transport-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-gui" "libqt6svg6" "protobuf-dev" "qml6-module-qt-labs-folderlistmodel" "qml6-module-qt-labs-platform" "qml6-module-qt-labs-settings" "qml6-module-qt5compat-graphicaleffects" "qml6-module-qtcharts" "qml6-module-qtcore" "qml6-module-qtpositioning" "qml6-module-qtqml" "qml6-module-qtqml-models" "qml6-module-qtqml-workerscript" "qml6-module-qtquick" "qml6-module-qtquick-controls" "qml6-module-qtquick-dialogs" "qml6-module-qtquick-layouts" "qml6-module-qtquick-templates" "qml6-module-qtquick-window" "qt6-5compat-dev" "qt6-base-dev" "qt6-base-private-dev" "qt6-declarative-dev" "qt6-declarative-private-dev" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "xvfb" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gz_gui_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_gui_vendor-source";
        url = "https://github.com/ros2-gbp/gz_gui_vendor-release.git";
        rev = "79c11b7413756d65e37dbcf663d1651fc96ef7a7";
        hash = "sha256-I7EbH+LE7kzMlJ6/NIAYQHtCvfJJchveihDqH4SY85o=";
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
        rev = "21a0e39879b21f4a7070b35dd1f8d71ac6cfe923";
        hash = "sha256-ScvHzltwmkS98KzTnlF/kd9DCcyfx3lSDovNvAWPDko=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-gui 10.0.0\n\n    Gazebo GUI : Graphical interfaces for robotics applications\n  ";
  };
})
