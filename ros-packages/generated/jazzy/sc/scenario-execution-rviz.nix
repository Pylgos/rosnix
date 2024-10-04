{
  ament-cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  py-trees-ros-interfaces,
  rclcpp,
  rosSystemPackages,
  rviz-common,
  scenario-execution-interfaces,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "scenario_execution_rviz" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_rviz-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "0e4b0d318216ff156ba7623ea333bc1a1d691996";
        hash = "sha256-nW1sOXS3Na8v/jqbZ6fa22xVFEZu/nuErEByIkni0vE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "scenario_execution_rviz";
  version = "1.2.0-3";
  src = sources."scenario_execution_rviz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs nav-msgs py-trees-ros-interfaces rclcpp rviz-common scenario-execution-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The scenario_execution_rviz package";
  };
}
