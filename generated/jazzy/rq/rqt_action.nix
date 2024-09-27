{
  ament_flake8,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rqt_gui,
  rqt_gui_py,
  rqt_msg,
  rqt_py_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_action-3e7beb2f37abb99e324091b4b07801e0517f66fd = substituteSource {
      src = fetchgit {
        name = "rqt_action-3e7beb2f37abb99e324091b4b07801e0517f66fd-source";
        url = "https://github.com/ros2-gbp/rqt_action-release.git";
        rev = "3e7beb2f37abb99e324091b4b07801e0517f66fd";
        hash = "sha256-BpjG5n+k8+z0l/4NhcvSTBOKKYBJF4u3LRRHw1jiGgg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_action";
  version = "2.2.0-3";
  src = sources.rqt_action-3e7beb2f37abb99e324091b4b07801e0517f66fd;
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rqt_gui rqt_gui_py rqt_msg rqt_py_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_flake8 ament_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "rqt_action provides a feature to introspect all available ROS action types.";
  };
}
