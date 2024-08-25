{
  ament_flake8,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_qt_binding,
  rclpy,
  ros2topic,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_topic = substituteSource {
      src = fetchgit {
        name = "rqt_topic-source";
        url = "https://github.com/ros2-gbp/rqt_topic-release.git";
        rev = "419526bbc11fbf3b356f16b7c468fcbf97c9e414";
        hash = "sha256-lyP4T37OAoevlCYiDxVNxAmDVtKMrlANBUt4YEvvQHI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_topic";
  version = "1.8.0-1";
  src = sources.rqt_topic;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding rclpy ros2topic rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_flake8 ament_xmllint python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "rqt_topic provides a GUI plugin for displaying debug information about ROS topics including publishers, subscribers, publishing rate, and ROS Messages.";
  };
}
