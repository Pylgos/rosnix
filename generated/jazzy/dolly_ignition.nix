{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  dolly_follow,
  fetchgit,
  fetchurl,
  fetchzip,
  ros2launch,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    dolly_ignition = substituteSource {
      src = fetchgit {
        name = "dolly_ignition-source";
        url = "https://github.com/ros2-gbp/dolly-release.git";
        rev = "30e66cc18f165d39df07f385651aa269dd5cb9f3";
        hash = "sha256-BGdsjbemIWS94BjSHjDClK1ui6sM17J0lJlrhfhj/Vg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dolly_ignition";
  version = "0.4.0-6";
  src = sources.dolly_ignition;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dolly_follow ros2launch rviz2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [ "ros_ign_bridge" "ros_ign_gazebo" ];
  meta = {
    description = "Launch Ignition simulation with Dolly robot.";
  };
}
