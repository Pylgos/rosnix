{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  qt_gui,
  qt_gui_py_common,
  rosSystemPackages,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_shell-6dc71a67c66af28d53271088c3eb566d31b883a6 = substituteSource {
      src = fetchgit {
        name = "rqt_shell-6dc71a67c66af28d53271088c3eb566d31b883a6-source";
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
  src = sources.rqt_shell-6dc71a67c66af28d53271088c3eb566d31b883a6;
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ python_qt_binding qt_gui qt_gui_py_common rqt_gui rqt_gui_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "rqt_shell is a Python GUI plugin providing an interactive shell.";
  };
}
