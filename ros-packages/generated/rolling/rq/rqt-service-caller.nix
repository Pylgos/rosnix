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
  version = "1.5.0-1";
  src = finalAttrs.passthru.sources."rqt_service_caller";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python python-qt-binding rqt-gui rqt-gui-py rqt-py-common ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding rqt-gui rqt-gui-py rqt-py-common ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_service_caller" = substituteSource {
      src = fetchgit {
        name = "rqt_service_caller-source";
        url = "https://github.com/ros2-gbp/rqt_service_caller-release.git";
        rev = "5f2698715461ca58e3258c4886a0d3134b98338a";
        hash = "sha256-wAYRU/T6UOtheHtmR+kksvExys/F/6sMJwtfmrvj8Ec=";
      };
    };
  });
  meta = {
    description = "rqt_service_caller provides a GUI plugin for calling arbitrary services.";
  };
})
