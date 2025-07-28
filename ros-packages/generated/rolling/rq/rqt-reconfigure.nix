{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-gui-py-common,
  rclpy,
  rosSystemPackages,
  rqt-console,
  rqt-gui,
  rqt-gui-py,
  rqt-py-common,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_reconfigure";
  version = "1.8.1-1";
  src = finalAttrs.passthru.sources."rqt_reconfigure";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python python-qt-binding qt-gui-py-common rclpy rqt-console rqt-gui rqt-gui-py rqt-py-common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python python-qt-binding qt-gui-py-common rclpy rqt-console rqt-gui rqt-gui-py rqt-py-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_reconfigure" = substituteSource {
      src = fetchgit {
        name = "rqt_reconfigure-source";
        url = "https://github.com/ros2-gbp/rqt_reconfigure-release.git";
        rev = "5019254243fe078135eb849b2fce29b26120a60c";
        hash = "sha256-uULNgDeFPkRk/4CGaatL8ADnIloKEY8d0Bq0w0msM1c=";
      };
    };
  });
  meta = {
    description = "\n    This rqt plugin provides a way to view and edit parameters on nodes.\n  ";
  };
})
