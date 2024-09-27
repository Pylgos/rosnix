{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_cmake_vendor,
  gz_common_vendor,
  gz_math_vendor,
  gz_msgs_vendor,
  gz_plugin_vendor,
  gz_rendering_vendor,
  gz_tools_vendor,
  gz_transport_vendor,
  gz_utils_vendor,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    gz_gui-vendor_source-036df090d5fb9323617ad186156e295a85e38421 = substituteSource {
      src = fetchgit {
        name = "gz_gui-vendor_source-036df090d5fb9323617ad186156e295a85e38421-source";
        url = "https://github.com/gazebosim/gz-gui.git";
        rev = "036df090d5fb9323617ad186156e295a85e38421";
        hash = "sha256-V0zaL6qrd510hMECCr3/mMkyqf4yu2aaKLRZ6Rw0s/4=";
      };
      substitutions = [
      ];
    };
    gz_gui_vendor-82b0c634c524413ebe86780dad2467869330a95e = substituteSource {
      src = fetchgit {
        name = "gz_gui_vendor-82b0c634c524413ebe86780dad2467869330a95e-source";
        url = "https://github.com/ros2-gbp/gz_gui_vendor-release.git";
        rev = "82b0c634c524413ebe86780dad2467869330a95e";
        hash = "sha256-mX/zGAcVec6WjBvtOoPd4DJiGel2DbTXhpaVqCvzRTM=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_gui-vendor_source-036df090d5fb9323617ad186156e295a85e38421}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_gui_vendor";
  version = "0.1.1-1";
  src = sources.gz_gui_vendor-82b0c634c524413ebe86780dad2467869330a95e;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_cmake_vendor gz_common_vendor gz_math_vendor gz_msgs_vendor gz_plugin_vendor gz_rendering_vendor gz_tools_vendor gz_transport_vendor gz_utils_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-gui8" "libqt5-core" "libqt5-qml" "libqt5-quick" "libqt5-widgets" "protobuf-dev" "qml-module-qt-labs-folderlistmodel" "qml-module-qt-labs-platform" "qml-module-qt-labs-settings" "qml-module-qtcharts" "qml-module-qtgraphicaleffects" "qml-module-qtlocation" "qml-module-qtpositioning" "qml-module-qtquick-controls" "qml-module-qtquick-controls2" "qml-module-qtquick-dialogs" "qml-module-qtquick-extras" "qml-module-qtquick-layouts" "qml-module-qtquick-templates2" "qml-module-qtquick-window2" "qml-module-qtquick2" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "tinyxml2" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "xvfb" ]; };
  meta = {
    description = "Vendor package for: gz-gui8 8.3.0 Gazebo GUI : Graphical interfaces for robotics applications";
  };
}
