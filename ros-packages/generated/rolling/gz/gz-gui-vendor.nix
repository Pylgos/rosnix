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
let
  sources = mkSourceSet (sources: {
    "gz_gui_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_gui_vendor-source";
        url = "https://github.com/ros2-gbp/gz_gui_vendor-release.git";
        rev = "acb33cc31d10b6b59508528576eaff03195262bb";
        hash = "sha256-p71+CYICh8hlqIg8DaEmric3Ij82IeDxMftz67K1G9Y=";
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
        rev = "d110e5b288e8b580b28c0a7256d0e1f0e0c402e2";
        hash = "sha256-/YJW6XmdGwbyd5Nx3wcTqnRlpwE1unVGaNX91qfZmiM=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_gui_vendor";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."gz_gui_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz-common-vendor gz-math-vendor gz-msgs-vendor gz-plugin-vendor gz-rendering-vendor gz-tools-vendor gz-transport-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-gui9" "libqt5-core" "libqt5-qml" "libqt5-quick" "libqt5-widgets" "protobuf-dev" "qml-module-qt-labs-folderlistmodel" "qml-module-qt-labs-platform" "qml-module-qt-labs-settings" "qml-module-qtcharts" "qml-module-qtgraphicaleffects" "qml-module-qtlocation" "qml-module-qtpositioning" "qml-module-qtquick-controls" "qml-module-qtquick-controls2" "qml-module-qtquick-dialogs" "qml-module-qtquick-extras" "qml-module-qtquick-layouts" "qml-module-qtquick-templates2" "qml-module-qtquick-window2" "qml-module-qtquick2" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "tinyxml2" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "xvfb" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Vendor package for: gz-gui9 9.0.0 Gazebo GUI : Graphical interfaces for robotics applications";
  };
})
