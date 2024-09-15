{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  ur_calibration,
  ur_controllers,
  ur_dashboard_msgs,
  ur_moveit_config,
  ur_robot_driver,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    ur = substituteSource {
      src = fetchgit {
        name = "ur-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "2294151491d69d168516772a72c7e772c860aa9f";
        hash = "sha256-oWrI2RS+KavgrqE+DiKOoAiC7uFb0JQ/yEACoOqHSVk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur";
  version = "2.4.9-1";
  src = sources.ur;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ur_calibration ur_controllers ur_dashboard_msgs ur_moveit_config ur_robot_driver ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Metapackage for universal robots";
  };
}
