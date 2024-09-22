{
  ament_copyright,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  qt_gui_py_common,
  rclpy,
  rosSystemPackages,
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
      src = fetchFromGitHub {
        name = "rqt_plot-source";
        owner = "ros2-gbp";
        repo = "rqt_plot-release";
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
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ python_qt_binding qt_gui_py_common rclpy rqt_gui rqt_gui_py rqt_py_common std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-matplotlib" "python3-numpy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "rqt_plot provides a GUI plugin visualizing numeric values in a 2D plot using different plotting backends.";
  };
}
