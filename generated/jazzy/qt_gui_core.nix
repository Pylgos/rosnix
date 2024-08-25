{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    qt_gui_core = substituteSource {
      src = fetchgit {
        name = "qt_gui_core-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "0d3d2456d64c9eae29bdacfb5c196129db530563";
        hash = "sha256-MY4qrGTr1ir5q/XdggeSBKaCGFXruCU/sFvoT1MNtQc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qt_gui_core";
  version = "2.7.4-2";
  src = sources.qt_gui_core;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Integration of the ROS package system and ROS-specific plugins for a Qt-based GUI.";
  };
}
