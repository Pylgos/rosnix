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
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."rqt_action";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rqt-gui rqt-gui-py rqt-msg rqt-py-common ];
  checkInputs = [ ament-flake8 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_action" = substituteSource {
      src = fetchgit {
        name = "rqt_action-source";
        url = "https://github.com/ros2-gbp/rqt_action-release.git";
        rev = "55dd23a694f1bceba5f1d3bc26893e4d8194acd5";
        hash = "sha256-c7Q3DoUUYVugs2Hu5w1qmS/qM5Spa5By2NOxCVS/ZsI=";
      };
    };
  });
  meta = {
    description = "rqt_action provides a feature to introspect all available ROS action types.";
  };
})
