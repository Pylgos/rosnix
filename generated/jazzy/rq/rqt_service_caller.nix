{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_service_caller-e98925d2967198ddbd60bb9df580fd8dff129f3d = substituteSource {
      src = fetchgit {
        name = "rqt_service_caller-e98925d2967198ddbd60bb9df580fd8dff129f3d-source";
        url = "https://github.com/ros2-gbp/rqt_service_caller-release.git";
        rev = "e98925d2967198ddbd60bb9df580fd8dff129f3d";
        hash = "sha256-SkbOwJQXbq432M9Ogjsl0vOfVi+A35O7CltyhS/2lk8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_service_caller";
  version = "1.2.1-3";
  src = sources.rqt_service_caller-e98925d2967198ddbd60bb9df580fd8dff129f3d;
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rqt_gui rqt_gui_py rqt_py_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "rqt_service_caller provides a GUI plugin for calling arbitrary services.";
  };
}
