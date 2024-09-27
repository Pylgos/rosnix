{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    qt_dotgraph-df5ed4eaa7ce604a0151a7de112565d02002ed92 = substituteSource {
      src = fetchgit {
        name = "qt_dotgraph-df5ed4eaa7ce604a0151a7de112565d02002ed92-source";
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
  src = sources.qt_dotgraph-df5ed4eaa7ce604a0151a7de112565d02002ed92;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ python_qt_binding ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pydot" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pygraphviz" ]; };
  meta = {
    description = "qt_dotgraph provides helpers to work with dot graphs.";
  };
}
