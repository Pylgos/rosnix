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
        rev = "1376dec5790ec2f47ea79b579ac66684aee5232b";
        hash = "sha256-hjDKsz1hq0zW5waUT2DAxJUfDJhJ7MndfTYdsHBLyN8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_shell";
  version = "1.3.0-1";
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
