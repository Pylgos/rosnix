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
        rev = "52f8e3aba192bc6b53bf11694e14db186806e32a";
        hash = "sha256-RSUNEl7XsDbe5ADnnFE4RcoGUzyO/JsEkqMF10Cs94w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_plot";
  version = "1.5.0-1";
  src = sources.rqt_plot;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.catkin-pkg ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.matplotlib python3Packages.numpy python_qt_binding qt_gui_py_common rclpy rqt_gui rqt_gui_py rqt_py_common std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "rqt_plot provides a GUI plugin visualizing numeric values in a 2D plot using different plotting backends.";
  };
}
