{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-gui,
  qt-gui-py-common,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_shell";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."rqt_shell";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" ]; };
  propagatedBuildInputs = [ python-qt-binding qt-gui qt-gui-py-common rqt-gui rqt-gui-py ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_shell" = substituteSource {
      src = fetchgit {
        name = "rqt_shell-source";
        url = "https://github.com/ros2-gbp/rqt_shell-release.git";
        rev = "1376dec5790ec2f47ea79b579ac66684aee5232b";
        hash = "sha256-hjDKsz1hq0zW5waUT2DAxJUfDJhJ7MndfTYdsHBLyN8=";
      };
    };
  });
  meta = {
    description = "rqt_shell is a Python GUI plugin providing an interactive shell.";
  };
})
