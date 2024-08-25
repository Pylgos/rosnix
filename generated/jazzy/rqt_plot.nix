{
  ament_copyright,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  qt_gui_py_common,
  rclpy,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_plot = substituteSource {
      src = fetchgit {
        name = "rqt_plot-source";
        url = "https://github.com/ros2-gbp/rqt_plot-release.git";
        rev = "ca0c115bb0c90da1c6fb4d03ef88c9c223205450";
        hash = "sha256-VmIIMvUcQ/f00LDrrtFDer4fk/echPE3VQcf6LgSZas=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_plot";
  version = "1.4.0-2";
  src = sources.rqt_plot;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.catkin-pkg buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.matplotlib python_qt_binding qt_gui_py_common rclpy rqt_gui rqt_gui_py rqt_py_common std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "rqt_plot provides a GUI plugin visualizing numeric values in a 2D plot using different plotting backends.";
  };
}
