{
  ament-flake8,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  rqt-msg,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_srv";
  version = "1.2.3-1";
  src = finalAttrs.passthru.sources."rqt_srv";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rqt-gui rqt-gui-py rqt-msg ];
  propagatedBuildInputs = [ rqt-gui rqt-gui-py rqt-msg ];
  checkInputs = [ ament-flake8 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_srv" = substituteSource {
      src = fetchgit {
        name = "rqt_srv-source";
        url = "https://github.com/ros2-gbp/rqt_srv-release.git";
        rev = "85557a1e9e753033f77ddd9ca7b12044172ff0ab";
        hash = "sha256-yHfHmzuNX6ld664gjdK9Ti8k2JtzPcQVUOk8RE/Dx7Y=";
      };
    };
  });
  meta = {
    description = "A Python GUI plugin for introspecting available ROS service types.";
  };
})
