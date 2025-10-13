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
  version = "1.6.1-1";
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
        rev = "c3ad7c0816cbb38cbcba10cc70cb25c8e9f09766";
        hash = "sha256-CKn9LTB+xq1MIa5uFJ48WkeBiMF7DfHKC0vZ6aQNLyM=";
      };
    };
  });
  meta = {
    description = "rqt is a Qt-based framework for GUI development for ROS.";
  };
})
