{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_core,
  rclcpp,
  rsl,
  substituteSource,
  trajectory_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    chomp_motion_planner = substituteSource {
      src = fetchgit {
        name = "chomp_motion_planner-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "8d2072a1cdb79eae16ddf9a6a52a91049fce8851";
        hash = "sha256-FHnAXCg4I5muP7vFkWMolNmTjY7+CfmJyqH38+qBOFg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "chomp_motion_planner";
  version = "2.10.0-1";
  src = sources.chomp_motion_planner;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_common moveit_core rclcpp rsl trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "chomp_motion_planner";
  };
}
