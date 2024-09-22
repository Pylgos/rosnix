{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_gui_vendor,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot4_gz_gui_plugins = substituteSource {
      src = fetchFromGitHub {
        name = "turtlebot4_gz_gui_plugins-source";
        owner = "ros2-gbp";
        repo = "turtlebot4_simulator-release";
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
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_gui_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qml-module-qtquick-extras" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Turtlebot4 Gazebo Simulator GUI Plugins";
  };
}
