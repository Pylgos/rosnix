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
  version = "1.2.1-3";
  src = finalAttrs.passthru.sources."rqt_service_caller";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rqt-gui rqt-gui-py rqt-py-common ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_service_caller" = substituteSource {
      src = fetchgit {
        name = "rqt_service_caller-source";
        url = "https://github.com/ros2-gbp/rqt_service_caller-release.git";
        rev = "e98925d2967198ddbd60bb9df580fd8dff129f3d";
        hash = "sha256-SkbOwJQXbq432M9Ogjsl0vOfVi+A35O7CltyhS/2lk8=";
      };
    };
  });
  meta = {
    description = "rqt_service_caller provides a GUI plugin for calling arbitrary services.";
  };
})
