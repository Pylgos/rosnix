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
  version = "2.4.1-2";
  src = finalAttrs.passthru.sources."rqt_action";
  propagatedNativeBuildInputs = [ rqt-gui rqt-gui-py rqt-msg rqt-py-common ];
  propagatedBuildInputs = [ rqt-gui rqt-gui-py rqt-msg rqt-py-common ];
  checkInputs = [ ament-flake8 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_action" = substituteSource {
      src = fetchgit {
        name = "rqt_action-source";
        url = "https://github.com/ros2-gbp/rqt_action-release.git";
        rev = "42ff511c2b8f3505fc7b6670dfab9096e73c809d";
        hash = "sha256-byLUMAvafanf5hIGP8Ili0c+KT1aPwE/XogKYVVHTS0=";
      };
    };
  });
  meta = {
    description = "rqt_action provides a feature to introspect all available ROS action types.";
  };
})
