{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-cpp,
  rqt-gui-py,
  rqt-py-common,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt";
  version = "1.9.1-1";
  src = finalAttrs.passthru.sources."rqt";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rqt-gui rqt-gui-cpp rqt-gui-py rqt-py-common ];
  propagatedBuildInputs = [ rqt-gui rqt-gui-cpp rqt-gui-py rqt-py-common ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt" = substituteSource {
      src = fetchgit {
        name = "rqt-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "bdd635a1556c6df0b75cb6bccb36bf9f8f94d7d2";
        hash = "sha256-nGRa8MCjUnvvxE2kKudyoN0MKK5j8TwVKJU3OrEHl9I=";
      };
    };
  });
  meta = {
    description = "rqt is a Qt-based framework for GUI development for ROS.";
  };
})
