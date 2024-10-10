{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  buildAmentPythonPackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-gui,
  rclpy,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "rqt_runtime_monitor" = substituteSource {
      src = fetchgit {
        name = "rqt_runtime_monitor-source";
        url = "https://github.com/ros2-gbp/rqt_runtime_monitor-release.git";
        rev = "8a3ca23e7d99c28c65dc0400ef34e5833ee4a5cb";
        hash = "sha256-7LyebmhKcj1ltMsj4LbDUxXX5v9ejuW4g4lIKitP28Q=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_runtime_monitor";
  version = "1.0.0-4";
  src = finalAttrs.passthru.sources."rqt_runtime_monitor";
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-rospkg" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-index-python diagnostic-msgs python-qt-binding qt-gui rclpy rqt-gui rqt-gui-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "rqt_runtime_monitor provides a GUI plugin viewing DiagnosticsArray messages.";
  };
})
