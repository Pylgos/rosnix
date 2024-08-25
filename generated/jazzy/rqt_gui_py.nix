{
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  qt_gui,
  rqt_gui,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_gui_py = substituteSource {
      src = fetchgit {
        name = "rqt_gui_py-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "90003d619c3aec91e9532590d384395add0a0571";
        hash = "sha256-QjZHZ660Tz4AV/n/ClJC+y1iDiqcBvEiUvtEh4iECxc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_gui_py";
  version = "1.6.0-2";
  src = sources.rqt_gui_py;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ qt_gui rqt_gui ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "rqt_gui_py enables GUI plugins to use the Python client library for ROS.";
  };
}
