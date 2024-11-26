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
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."rqt_reconfigure";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python python-qt-binding qt-gui-py-common rclpy rqt-console rqt-gui rqt-gui-py rqt-py-common ];
  checkInputs = [ ament-copyright ament-flake8 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "rqt_reconfigure" = substituteSource {
        src = fetchgit {
          name = "rqt_reconfigure-source";
          url = "https://github.com/ros2-gbp/rqt_reconfigure-release.git";
          rev = "6c3295518fa31f3dccc64b4b37bf84e2abb0027a";
          hash = "sha256-ThnCAIGGrmrx8NAdfSMTjsXM8l4EPYJfg9bSORYEL2U=";
        };
      };
    });
  };
  meta = {
    description = "This rqt plugin provides a way to view and edit parameters on nodes.";
  };
})
