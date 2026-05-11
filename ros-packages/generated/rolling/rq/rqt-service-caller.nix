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
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_service_caller";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."rqt_service_caller";
  propagatedNativeBuildInputs = [ ament-index-python python-qt-binding rqt-gui rqt-gui-py rqt-py-common ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding rqt-gui rqt-gui-py rqt-py-common ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_service_caller" = substituteSource {
      src = fetchgit {
        name = "rqt_service_caller-source";
        url = "https://github.com/ros2-gbp/rqt_service_caller-release.git";
        rev = "bdd24ab27c86aebc14d5a726533f843755e21a91";
        hash = "sha256-9mG8B1tofdF00w/47eMimzsyOz0qPxiEGpcI0bkLdXw=";
      };
    };
  });
  meta = {
    description = "rqt_service_caller provides a GUI plugin for calling arbitrary services.";
  };
})
