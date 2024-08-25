{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    qt_dotgraph = substituteSource {
      src = fetchgit {
        name = "qt_dotgraph-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "df5ed4eaa7ce604a0151a7de112565d02002ed92";
        hash = "sha256-xSrYXna505AJrLy4VVrZBjFhlKzbSbllA59P7+MNWCo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qt_dotgraph";
  version = "2.8.2-1";
  src = sources.qt_dotgraph;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.pydot python_qt_binding ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common python3Packages.pygraphviz ];
  missingDependencies = [  ];
  meta = {
    description = "qt_dotgraph provides helpers to work with dot graphs.";
  };
}
