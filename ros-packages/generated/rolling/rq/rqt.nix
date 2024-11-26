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
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."rqt";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rqt-gui rqt-gui-cpp rqt-gui-py rqt-py-common ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt" = substituteSource {
      src = fetchgit {
        name = "rqt-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "ea318f808c06728880b2cb8ee6bfe84e6cc6ab2c";
        hash = "sha256-CsnKyo8je0MMHJQTURnjrZIpEN6OkATE5E0MJUBgXRg=";
      };
    };
  });
  meta = {
    description = "rqt is a Qt-based framework for GUI development for ROS.";
  };
})
