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
  version = "1.6.0-2";
  src = finalAttrs.passthru.sources."rqt";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rqt-gui rqt-gui-cpp rqt-gui-py rqt-py-common ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt" = substituteSource {
      src = fetchgit {
        name = "rqt-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "74f9483352ef59abf5b390f088660c02914ee74f";
        hash = "sha256-peBv6HLShNFar0fL+NpWuVKsiVpkVkHzSejtvm5eYg4=";
      };
    };
  });
  meta = {
    description = "rqt is a Qt-based framework for GUI development for ROS.";
  };
})
