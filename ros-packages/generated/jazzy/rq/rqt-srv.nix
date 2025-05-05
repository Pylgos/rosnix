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
  version = "1.2.2-3";
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
        rev = "a139307d763dc09a9e001d93d3ba014726cbbc9f";
        hash = "sha256-sb6x9v14bi5IE3lj47VcC0k7Asl/8ue55fXQ7xMqvDk=";
      };
    };
  });
  meta = {
    description = "A Python GUI plugin for introspecting available ROS service types.";
  };
})
