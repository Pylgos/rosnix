{
  ament_cmake,
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  backward_ros,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  libyamlcpp,
  nlohmann_json,
  proj,
  rclcpp,
  rmf_building_map_msgs,
  rmf_fleet_msgs,
  rmf_site_map_msgs,
  rmf_traffic,
  rmf_traffic_msgs,
  rmf_utils,
  substituteSource,
  util-linux,
  zlib,
}:
let
  sources = rec {
    rmf_traffic_ros2 = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_ros2-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "8fe01ade5f770221dc54219ee829cd4c0d071408";
        hash = "sha256-bIH0kmEEfv2YrjgqN0A03ExlFiNeb1mTtBYDbKXLttg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic_ros2";
  version = "2.7.1-1";
  src = sources.rmf_traffic_ros2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros eigen libyamlcpp nlohmann_json proj rclcpp rmf_building_map_msgs rmf_fleet_msgs rmf_site_map_msgs rmf_traffic rmf_traffic_msgs rmf_utils util-linux zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_catch2 ament_cmake_uncrustify ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing messages used by the RMF traffic management system.";
  };
}
