{
  ament_flake8,
  ament_index_python,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  qt_gui,
  qt_gui_py_common,
  rclpy,
  rosSystemPackages,
  rqt_gui,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_gauges-fae55efa182e582154dd83da2cf3e8f2ae94843c = substituteSource {
      src = fetchgit {
        name = "rqt_gauges-fae55efa182e582154dd83da2cf3e8f2ae94843c-source";
        url = "https://github.com/ros2-gbp/rqt_gauges-release.git";
        rev = "fae55efa182e582154dd83da2cf3e8f2ae94843c";
        hash = "sha256-ie5l6SHrK6cQczLp2R3MdzrJRVZGAxGnuO7NzFIwbJY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_gauges";
  version = "0.0.3-2";
  src = sources.rqt_gauges-fae55efa182e582154dd83da2cf3e8f2ae94843c;
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python qt_gui qt_gui_py_common rclpy rqt_gui rqt_gui_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_flake8 ament_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Visualization plugin for several sensors.";
  };
}
