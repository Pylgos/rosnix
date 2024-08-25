{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rqt_gui,
  rqt_gui_cpp,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt = substituteSource {
      src = fetchgit {
        name = "rqt-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "f575ef11e4b5354b169b17509a12db2b0699f6fd";
        hash = "sha256-wUFaY/hZFxo+wn1CfJmY9ANN+7AAl4GNKJ1P8NgUImw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt";
  version = "1.7.2-1";
  src = sources.rqt;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rqt_gui rqt_gui_cpp rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "rqt is a Qt-based framework for GUI development for ROS.";
  };
}
