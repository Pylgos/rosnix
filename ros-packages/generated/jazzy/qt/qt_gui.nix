{
  ament_cmake,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  rosSystemPackages,
  substituteSource,
  tango_icons_vendor,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    qt_gui-f7a152206f14b0d5e5120c41677a073aad67797b = substituteSource {
      src = fetchgit {
        name = "qt_gui-f7a152206f14b0d5e5120c41677a073aad67797b-source";
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
  src = sources.qt_gui-f7a152206f14b0d5e5120c41677a073aad67797b;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python python_qt_binding tango_icons_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-qt5-bindings" "qt5-qmake" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "qt_gui provides the infrastructure for an integrated graphical user interface based on Qt. It is extensible with Python- and C++-based plugins (implemented in separate packages) which can contribute arbitrary widgets. It requires either PyQt or PySide bindings.";
  };
}
