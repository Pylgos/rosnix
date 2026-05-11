{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
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
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_shell";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."rqt_shell";
  propagatedNativeBuildInputs = [ python-qt-binding qt-gui qt-gui-py-common rqt-gui rqt-gui-py ];
  propagatedBuildInputs = [ python-qt-binding qt-gui qt-gui-py-common rqt-gui rqt-gui-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_shell" = substituteSource {
      src = fetchgit {
        name = "rqt_shell-source";
        url = "https://github.com/ros2-gbp/rqt_shell-release.git";
        rev = "a811d88acee1213262d344ba03b8a00109df6482";
        hash = "sha256-BvEk6iCf6K2hKlNDlJLm7gkICFEKFW17C727vYKGx8U=";
      };
    };
  });
  meta = {
    description = "rqt_shell is a Python GUI plugin providing an interactive shell.";
  };
})
