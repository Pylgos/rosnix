{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  qt_gui,
  qt_gui_py_common,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_shell = substituteSource {
      src = fetchgit {
        name = "rqt_shell-source";
        url = "https://github.com/ros2-gbp/rqt_shell-release.git";
        rev = "6dc71a67c66af28d53271088c3eb566d31b883a6";
        hash = "sha256-PrYmOnuXCXtk1fSjFdX/IY2yiWZtCWukgeHIycvxpEY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_shell";
  version = "1.2.2-2";
  src = sources.rqt_shell;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.catkin-pkg ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding qt_gui qt_gui_py_common rqt_gui rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "rqt_shell is a Python GUI plugin providing an interactive shell.";
  };
}
