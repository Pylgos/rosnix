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
    dolly_gazebo = substituteSource {
      src = fetchgit {
        name = "dolly_gazebo-source";
        url = "https://github.com/ros2-gbp/dolly-release.git";
        rev = "0bde960b5ce53fba85a03fa3f289a6f4a2ca1286";
        hash = "sha256-sLCbhJjIRzZvq15SlStZjonIvhpPw57fK5vRlQ3689A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dolly_gazebo";
  version = "0.4.0-6";
  src = sources.dolly_gazebo;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dolly_follow ros2launch rviz2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [ "gazebo_ros_pkgs" ];
  meta = {
    description = "Launch Gazebo simulation with Dolly robot.";
  };
}
