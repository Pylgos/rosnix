{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_service_caller = substituteSource {
      src = fetchgit {
        name = "rqt_service_caller-source";
        url = "https://github.com/ros2-gbp/rqt_service_caller-release.git";
        rev = "c695cb4b04aac9d38fc7eb36033f69144d2c5381";
        hash = "sha256-/LpzLf7nvji4yIfpw9SDl/APSGXHsU9K1daXhoIsD5M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_service_caller";
  version = "1.3.0-1";
  src = sources.rqt_service_caller;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "rqt_service_caller provides a GUI plugin for calling arbitrary services.";
  };
}
