{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  rmf_building_map_msgs,
  rmf_utils,
  rmf_visualization_msgs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmf_visualization_floorplans = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_floorplans-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "5543de571340f7c6d374ddb0fe404e17adcb0261";
        hash = "sha256-BxNcC59t9WO3W0PX0Rv+O/5chNuWk6lIDXqubQQLMBQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_floorplans";
  version = "2.3.2-1";
  src = sources.rmf_visualization_floorplans;
  nativeBuildInputs = [ ament_cmake eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs nav_msgs rclcpp rclcpp_components rmf_building_map_msgs rmf_visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libopencv-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common rmf_utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package to visualize the floorplans for levels in a building";
  };
}
