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
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_action";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."rqt_action";
  propagatedNativeBuildInputs = [ rqt-gui rqt-gui-py rqt-msg rqt-py-common ];
  propagatedBuildInputs = [ rqt-gui rqt-gui-py rqt-msg rqt-py-common ];
  checkInputs = [ ament-flake8 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_action" = substituteSource {
      src = fetchgit {
        name = "rqt_action-source";
        url = "https://github.com/ros2-gbp/rqt_action-release.git";
        rev = "85782e37161e59f3e4fb413b8c7c9d2c18c93311";
        hash = "sha256-LfwEWk24F620phKh6z9G83Vnol44zE5PaGvhvHrDTdY=";
      };
    };
  });
  meta = {
    description = "rqt_action provides a feature to introspect all available ROS action types.";
  };
})
