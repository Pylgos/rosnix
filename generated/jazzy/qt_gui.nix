{
  ament_cmake,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  qt5,
  substituteSource,
  tango_icons_vendor,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    qt_gui = substituteSource {
      src = fetchgit {
        name = "qt_gui-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "f7a152206f14b0d5e5120c41677a073aad67797b";
        hash = "sha256-YuRclZVVR6g6KaGhlNV5lAJE4+tZoD2yCApPKtlMw5w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qt_gui";
  version = "2.7.4-2";
  src = sources.qt_gui;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.catkin-pkg ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python python3Packages.pyqt5 python3Packages.pyside2 python3Packages.sip4 python_qt_binding qt5.qtbase tango_icons_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "qt_gui provides the infrastructure for an integrated graphical user interface based on Qt. It is extensible with Python- and C++-based plugins (implemented in separate packages) which can contribute arbitrary widgets. It requires either PyQt or PySide bindings.";
  };
}
