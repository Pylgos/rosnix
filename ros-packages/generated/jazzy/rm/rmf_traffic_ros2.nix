{
  ament_cmake,
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  backward_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rmf_building_map_msgs,
  rmf_fleet_msgs,
  rmf_site_map_msgs,
  rmf_traffic,
  rmf_traffic_msgs,
  rmf_utils,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmf_traffic_ros2-40fa2ed90aa5a1e948f10bd91179e7f69a266bb1 = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_ros2-40fa2ed90aa5a1e948f10bd91179e7f69a266bb1-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "40fa2ed90aa5a1e948f10bd91179e7f69a266bb1";
        hash = "sha256-KFBuTj1Pd07XXDg4yJb/k/348Kok9/gssa/Sp2avtes=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic_ros2";
  version = "2.7.2-1";
  src = sources.rmf_traffic_ros2-40fa2ed90aa5a1e948f10bd91179e7f69a266bb1;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ backward_ros rclcpp rmf_building_map_msgs rmf_fleet_msgs rmf_site_map_msgs rmf_traffic rmf_traffic_msgs rmf_utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "nlohmann-json-dev" "proj" "uuid" "yaml-cpp" "zlib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_catch2 ament_cmake_uncrustify ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing messages used by the RMF traffic management system.";
  };
}
