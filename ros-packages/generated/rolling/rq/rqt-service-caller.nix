{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  rqt-py-common,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_service_caller";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."rqt_service_caller";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rqt-gui rqt-gui-py rqt-py-common ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "rqt_service_caller" = substituteSource {
        src = fetchgit {
          name = "rqt_service_caller-source";
          url = "https://github.com/ros2-gbp/rqt_service_caller-release.git";
          rev = "c695cb4b04aac9d38fc7eb36033f69144d2c5381";
          hash = "sha256-/LpzLf7nvji4yIfpw9SDl/APSGXHsU9K1daXhoIsD5M=";
        };
      };
    });
  };
  meta = {
    description = "rqt_service_caller provides a GUI plugin for calling arbitrary services.";
  };
})
