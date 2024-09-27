{
  ament_cmake_auto,
  ament_cmake_ros,
  autoware_cmake,
  autoware_map_msgs,
  autoware_planning_msgs,
  autoware_utils,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  lanelet2_core,
  lanelet2_io,
  lanelet2_maps,
  lanelet2_projection,
  lanelet2_routing,
  lanelet2_traffic_rules,
  lanelet2_validation,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  visualization_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "autoware_lanelet2_extension" = substituteSource {
      src = fetchgit {
        name = "autoware_lanelet2_extension-source";
        url = "https://github.com/ros2-gbp/autoware_lanelet2_extension-release.git";
        rev = "cc17a16963d747fb998f1a8223077c654b5d8beb";
        hash = "sha256-hCTVBEAFHHCe8f524kEhnkm4yU9EZnItUg/f2dPj91w=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "autoware_lanelet2_extension";
  version = "0.6.0-1";
  src = sources."autoware_lanelet2_extension";
  nativeBuildInputs = [ ament_cmake_auto autoware_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ autoware_map_msgs autoware_planning_msgs autoware_utils geometry_msgs lanelet2_core lanelet2_io lanelet2_maps lanelet2_projection lanelet2_routing lanelet2_traffic_rules lanelet2_validation rclcpp tf2 tf2_geometry_msgs visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "geographiclib" "pugixml-dev" "range-v3" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The autoware_lanelet2_extension package contains libraries to handle Lanelet2 format data.";
  };
}
