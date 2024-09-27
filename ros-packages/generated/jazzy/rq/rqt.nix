{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rqt_gui,
  rqt_gui_cpp,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt-74f9483352ef59abf5b390f088660c02914ee74f = substituteSource {
      src = fetchgit {
        name = "rqt-74f9483352ef59abf5b390f088660c02914ee74f-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "74f9483352ef59abf5b390f088660c02914ee74f";
        hash = "sha256-peBv6HLShNFar0fL+NpWuVKsiVpkVkHzSejtvm5eYg4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt";
  version = "1.6.0-2";
  src = sources.rqt-74f9483352ef59abf5b390f088660c02914ee74f;
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rqt_gui rqt_gui_cpp rqt_gui_py rqt_py_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "rqt is a Qt-based framework for GUI development for ROS.";
  };
}
