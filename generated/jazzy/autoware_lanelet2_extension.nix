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
  geographiclib,
  geometry_msgs,
  lanelet2_core,
  lanelet2_io,
  lanelet2_maps,
  lanelet2_projection,
  lanelet2_routing,
  lanelet2_traffic_rules,
  lanelet2_validation,
  pugixml,
  rclcpp,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    autoware_lanelet2_extension = substituteSource {
      src = fetchgit {
        name = "autoware_lanelet2_extension-source";
        url = "https://github.com/ros2-gbp/autoware_lanelet2_extension-release.git";
        rev = "4952a5748e785ee484927679b14438b9c189628c";
        hash = "sha256-FFcXqCj03T/NFLGwGGby2tN9kbPuMqJAor1gEKCxDfA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_lanelet2_extension";
  version = "0.5.0-1";
  src = sources.autoware_lanelet2_extension;
  nativeBuildInputs = [ ament_cmake_auto autoware_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ autoware_map_msgs autoware_planning_msgs autoware_utils geographiclib geometry_msgs lanelet2_core lanelet2_io lanelet2_maps lanelet2_projection lanelet2_routing lanelet2_traffic_rules lanelet2_validation pugixml rclcpp tf2 tf2_geometry_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_ros ];
  missingDependencies = [ "range-v3" ];
  meta = {
    description = "The autoware_lanelet2_extension package contains libraries to handle Lanelet2 format data.";
  };
}
