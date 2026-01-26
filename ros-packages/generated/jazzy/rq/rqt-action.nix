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
  version = "2.2.1-1";
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
        rev = "bba1cd2d2ab22ac5f5fa93b590dc3f27db73de0a";
        hash = "sha256-UNIX5c/tmqhYdVUd4728BfPNUipngSbA60f5JwpyVFA=";
      };
    };
  });
  meta = {
    description = "rqt_action provides a feature to introspect all available ROS action types.";
  };
})
