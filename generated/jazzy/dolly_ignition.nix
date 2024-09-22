{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  dolly_follow,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  ros2launch,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    dolly_ignition = substituteSource {
      src = fetchFromGitHub {
        name = "dolly_ignition-source";
        owner = "ros2-gbp";
        repo = "dolly-release";
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
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ dolly_follow ros2launch rviz2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ros_ign_bridge" "ros_ign_gazebo" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Launch Ignition simulation with Dolly robot.";
  };
}
