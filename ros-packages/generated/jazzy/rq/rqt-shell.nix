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
  version = "1.2.2-2";
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
        rev = "6dc71a67c66af28d53271088c3eb566d31b883a6";
        hash = "sha256-PrYmOnuXCXtk1fSjFdX/IY2yiWZtCWukgeHIycvxpEY=";
      };
    };
  });
  meta = {
    description = "rqt_shell is a Python GUI plugin providing an interactive shell.";
  };
})
