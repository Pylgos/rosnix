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
  version = "1.4.1-1";
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
        rev = "a5bd71d0cef41c48f4ef6a6d54ba0212581b5219";
        hash = "sha256-5AZ9mps3pLn5NKyhsHu3Eg9gLHbdHdSg4+1HZzyqhH0=";
      };
    };
  });
  meta = {
    description = "A Python GUI plugin for introspecting available ROS service types.";
  };
})
