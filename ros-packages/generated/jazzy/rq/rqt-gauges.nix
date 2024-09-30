{
  ament-flake8,
  ament-index-python,
  ament-xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  qt-gui,
  qt-gui-py-common,
  rclpy,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "rqt_gauges" = substituteSource {
      src = fetchgit {
        name = "rqt_gauges-source";
        url = "https://github.com/ros2-gbp/rqt_gauges-release.git";
        rev = "fae55efa182e582154dd83da2cf3e8f2ae94843c";
        hash = "sha256-ie5l6SHrK6cQczLp2R3MdzrJRVZGAxGnuO7NzFIwbJY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rqt_gauges";
  version = "0.0.3-2";
  src = sources."rqt_gauges";
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-index-python qt-gui qt-gui-py-common rclpy rqt-gui rqt-gui-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-flake8 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Visualization plugin for several sensors.";
  };
}
