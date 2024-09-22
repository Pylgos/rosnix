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
        rev = "f5db5d7c7aefab0558adc27f85c26317b2c6a9b5";
        hash = "sha256-h7XVWFNOGkW7n/Hl3mNY49cX8M1WstyBA0c3fbA4mJo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_floorplans";
  version = "2.4.0-1";
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
