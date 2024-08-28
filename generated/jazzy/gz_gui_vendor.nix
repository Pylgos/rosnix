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
  protobuf,
  qt5,
  substituteSource,
  tinyxml-2,
  wrapRosQtAppsHook,
  xorg,
}:
let
  sources = rec {
    gz_gui_vendor = substituteSource {
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
          to = "VCS_TYPE path VCS_URL ${gz_gui_vendor-vendor_source-gz-gui-0}";
        }
      ];
    };
    gz_gui_vendor-vendor_source-gz-gui-0 = substituteSource {
      src = fetchgit {
        name = "gz_gui_vendor-vendor_source-gz-gui-0-source";
        url = "https://github.com/gazebosim/gz-gui.git";
        rev = "036df090d5fb9323617ad186156e295a85e38421";
        hash = "sha256-V0zaL6qrd510hMECCr3/mMkyqf4yu2aaKLRZ6Rw0s/4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_gui_vendor";
  version = "0.0.4-1";
  src = sources.gz_gui_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gz_cmake_vendor gz_math_vendor gz_utils_vendor ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_common_vendor gz_msgs_vendor gz_plugin_vendor gz_rendering_vendor gz_tools_vendor gz_transport_vendor protobuf qt5.qtbase qt5.qtdeclarative tinyxml-2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint xorg.xorgserver ];
  missingDependencies = [ "gz-gui8" "qml-module-qt-labs-folderlistmodel" "qml-module-qt-labs-platform" "qml-module-qt-labs-settings" "qml-module-qtcharts" "qml-module-qtgraphicaleffects" "qml-module-qtlocation" "qml-module-qtpositioning" "qml-module-qtquick-controls" "qml-module-qtquick-controls2" "qml-module-qtquick-dialogs" "qml-module-qtquick-extras" "qml-module-qtquick-layouts" "qml-module-qtquick-templates2" "qml-module-qtquick-window2" "qml-module-qtquick2" "qtquickcontrols2-5-dev" ];
  meta = {
    description = "Vendor package for: gz-gui8 8.3.0 Gazebo GUI : Graphical interfaces for robotics applications";
  };
}
