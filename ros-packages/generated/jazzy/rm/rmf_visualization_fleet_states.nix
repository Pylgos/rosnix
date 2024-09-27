{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  rmf_fleet_msgs,
  rmf_utils,
  rmf_visualization_msgs,
  rosSystemPackages,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    rmf_visualization_fleet_states-9946b5947d41a77654c9740630532215f888f8ea = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_fleet_states-9946b5947d41a77654c9740630532215f888f8ea-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "9946b5947d41a77654c9740630532215f888f8ea";
        hash = "sha256-/OUN3LLuQOV7jZ7wDvSaySMVfCHoeErt7GxHZdSUd9c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_fleet_states";
  version = "2.3.2-1";
  src = sources.rmf_visualization_fleet_states-9946b5947d41a77654c9740630532215f888f8ea;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp_components rmf_fleet_msgs rmf_visualization_msgs visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common rmf_utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package to visualize positions of robots from different fleets in the a building";
  };
}
