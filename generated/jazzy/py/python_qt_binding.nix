{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    python_qt_binding-68ffe1fac31519713735be637c6c3280455dbc2a = substituteSource {
      src = fetchgit {
        name = "python_qt_binding-68ffe1fac31519713735be637c6c3280455dbc2a-source";
        url = "https://github.com/ros2-gbp/python_qt_binding-release.git";
        rev = "68ffe1fac31519713735be637c6c3280455dbc2a";
        hash = "sha256-6O8drSOVJ+eJfYkt/pqnGBJYqAulmgEjbElU4k8h68M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "python_qt_binding";
  version = "2.2.1-1";
  src = sources.python_qt_binding-68ffe1fac31519713735be637c6c3280455dbc2a;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-qt5-bindings" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This stack provides Python bindings for Qt. There are two providers: pyside and pyqt. PySide2 is available under the GPL, LGPL and a commercial license. PyQt is released under the GPL. Both the bindings and tools to build bindings are included from each available provider. For PySide, it is called \"Shiboken\". For PyQt, this is called \"SIP\". Also provided is adapter code to make the user's Python code independent of which binding provider was actually used which makes it very easy to switch between these.";
  };
}
