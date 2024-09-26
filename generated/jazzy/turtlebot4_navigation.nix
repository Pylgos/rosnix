{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_bringup,
  nav2_simple_commander,
  rosSystemPackages,
  slam_toolbox,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot4_navigation = substituteSource {
      src = fetchgit {
        name = "turtlebot4_navigation-source";
        url = "https://github.com/ros2-gbp/turtlebot4-release.git";
        rev = "74426a1eceddb92a218751b8986ea535400e8e21";
        hash = "sha256-eP0VlB/x4/bYG0FbQXDGsrcmzsEV0fcTf/mgpe2JmwA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_navigation";
  version = "2.0.1-1";
  src = sources.turtlebot4_navigation;
  nativeBuildInputs = [ ament_cmake ament_cmake_python wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ nav2_bringup nav2_simple_commander slam_toolbox ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Turtlebot4 Navigation";
  };
}
