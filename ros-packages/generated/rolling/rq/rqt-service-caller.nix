{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  rqt-py-common,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_service_caller";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."rqt_service_caller";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding rqt-gui rqt-gui-py rqt-py-common ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_service_caller" = substituteSource {
      src = fetchgit {
        name = "rqt_service_caller-source";
        url = "https://github.com/ros2-gbp/rqt_service_caller-release.git";
        rev = "8c3ae90bd185aa5ffb60fcd282c2a26fe62fba8a";
        hash = "sha256-m7NC6lnJMtNfz1CrhT2iK5B2g7IgL20lbJqG7qnYbQY=";
      };
    };
  });
  meta = {
    description = "rqt_service_caller provides a GUI plugin for calling arbitrary services.";
  };
})
