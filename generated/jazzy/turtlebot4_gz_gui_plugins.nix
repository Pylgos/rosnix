{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_gui_vendor,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot4_gz_gui_plugins = substituteSource {
      src = fetchgit {
        name = "turtlebot4_gz_gui_plugins-source";
        url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
        rev = "e970a62f62d599bc96857fe33572accbe522b3c1";
        hash = "sha256-2z7RxnkbZ1RkQvR6RQNarvfiXmd78IQc6VmvvVva6eQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_gz_gui_plugins";
  version = "2.0.0-1";
  src = sources.turtlebot4_gz_gui_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_gui_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [ "qml-module-qtquick-extras" ];
  meta = {
    description = "Turtlebot4 Gazebo Simulator GUI Plugins";
  };
}
