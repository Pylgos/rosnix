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
  rqt-py-common,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_action";
  version = "2.4.1-1";
  src = finalAttrs.passthru.sources."rqt_action";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rqt-gui rqt-gui-py rqt-msg rqt-py-common ];
  propagatedBuildInputs = [ rqt-gui rqt-gui-py rqt-msg rqt-py-common ];
  checkInputs = [ ament-flake8 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_action" = substituteSource {
      src = fetchgit {
        name = "rqt_action-source";
        url = "https://github.com/ros2-gbp/rqt_action-release.git";
        rev = "8c80d0d7969af3871f98d3ed88c0ee5d81cfd9bb";
        hash = "sha256-byLUMAvafanf5hIGP8Ili0c+KT1aPwE/XogKYVVHTS0=";
      };
    };
  });
  meta = {
    description = "rqt_action provides a feature to introspect all available ROS action types.";
  };
})
