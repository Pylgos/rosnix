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
        rev = "f4dc66c120b1196c813ea3c91f55e17c7565ff86";
        hash = "sha256-neIiFXuQRDJ4lsjRo1j9tUX/QwS8Qsz2SSvk8AaL3yE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qt_dotgraph";
  version = "2.7.4-2";
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
