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
  version = "2.2.0-3";
  src = finalAttrs.passthru.sources."rqt_action";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rqt-gui rqt-gui-py rqt-msg rqt-py-common ];
  checkInputs = [ ament-flake8 ament-xmllint ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rqt_action" = substituteSource {
        src = fetchgit {
          name = "rqt_action-source";
          url = "https://github.com/ros2-gbp/rqt_action-release.git";
          rev = "3e7beb2f37abb99e324091b4b07801e0517f66fd";
          hash = "sha256-BpjG5n+k8+z0l/4NhcvSTBOKKYBJF4u3LRRHw1jiGgg=";
        };
      };
    });
  };
  meta = {
    description = "rqt_action provides a feature to introspect all available ROS action types.";
  };
})
