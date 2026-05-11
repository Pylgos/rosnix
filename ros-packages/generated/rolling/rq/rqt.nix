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
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."rqt";
  propagatedNativeBuildInputs = [ rqt-gui rqt-gui-cpp rqt-gui-py rqt-py-common ];
  propagatedBuildInputs = [ rqt-gui rqt-gui-cpp rqt-gui-py rqt-py-common ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt" = substituteSource {
      src = fetchgit {
        name = "rqt-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "2b541078a7517ba9020cb17e5f78515b3d75538c";
        hash = "sha256-N0i+KvRyXc0g7vV7VThn/oiP5d4C2Fpr4Wh0zdAjAoA=";
      };
    };
  });
  meta = {
    description = "rqt is a Qt-based framework for GUI development for ROS.";
  };
})
