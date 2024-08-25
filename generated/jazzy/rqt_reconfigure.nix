{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_xmllint,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  qt_gui_py_common,
  rclpy,
  rqt_console,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_reconfigure = substituteSource {
      src = fetchgit {
        name = "rqt_reconfigure-source";
        url = "https://github.com/ros2-gbp/rqt_reconfigure-release.git";
        rev = "a7fa894fe92c07f1c317c593830ae7d31bcc59ad";
        hash = "sha256-rtGFPpkjpqWFtwS3+dluHUc6chX6awVufZbN1zksUJM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_reconfigure";
  version = "1.6.2-3";
  src = sources.rqt_reconfigure;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python python_qt_binding qt_gui_py_common rclpy rqt_console rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_xmllint python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "This rqt plugin provides a way to view and edit parameters on nodes.";
  };
}
