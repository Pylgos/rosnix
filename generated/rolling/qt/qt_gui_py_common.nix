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
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    qt_gui_py_common-f44c96e1a0306fc3c9e68adb9d86020aebf17f83 = substituteSource {
      src = fetchgit {
        name = "qt_gui_py_common-f44c96e1a0306fc3c9e68adb9d86020aebf17f83-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "f44c96e1a0306fc3c9e68adb9d86020aebf17f83";
        hash = "sha256-wnrYXS+zQXlBgPfVKcuQOJMJwi+ZZ53xzq0/Yk21/iY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qt_gui_py_common";
  version = "2.8.2-1";
  src = sources.qt_gui_py_common-f44c96e1a0306fc3c9e68adb9d86020aebf17f83;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python python_qt_binding ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "qt_gui_py_common provides common functionality for GUI plugins written in Python.";
  };
}
