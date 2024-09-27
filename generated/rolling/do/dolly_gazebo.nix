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
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    dolly_gazebo-30060ffd0d83f819734f575a8fb4939eeb2b2087 = substituteSource {
      src = fetchgit {
        name = "dolly_gazebo-30060ffd0d83f819734f575a8fb4939eeb2b2087-source";
        url = "https://github.com/ros2-gbp/dolly-release.git";
        rev = "30060ffd0d83f819734f575a8fb4939eeb2b2087";
        hash = "sha256-sLCbhJjIRzZvq15SlStZjonIvhpPw57fK5vRlQ3689A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dolly_gazebo";
  version = "0.4.0-5";
  src = sources.dolly_gazebo-30060ffd0d83f819734f575a8fb4939eeb2b2087;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ dolly_follow ros2launch rviz2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gazebo_ros_pkgs" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Launch Gazebo simulation with Dolly robot.";
  };
}
