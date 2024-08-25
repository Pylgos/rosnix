{
  ament_cmake,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  qt_gui,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    qt_gui_app = substituteSource {
      src = fetchgit {
        name = "qt_gui_app-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "1a01067cf80037481f6949abe6b5941350867b24";
        hash = "sha256-Sor72UP2YXAqhkJzqlWRTCiT6J5EtBB7kuWEDWJ6TSw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qt_gui_app";
  version = "2.8.2-1";
  src = sources.qt_gui_app;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python qt_gui ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "qt_gui_app provides the main to start an instance of the integrated graphical user interface provided by qt_gui.";
  };
}
