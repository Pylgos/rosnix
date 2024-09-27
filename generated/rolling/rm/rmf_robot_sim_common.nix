{
  ament_cmake,
  buildRosPackage,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rmf_building_map_msgs,
  rmf_dispenser_msgs,
  rmf_fleet_msgs,
  rmf_ingestor_msgs,
  rosSystemPackages,
  std_msgs,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    rmf_robot_sim_common = substituteSource {
      src = fetchgit {
        name = "rmf_robot_sim_common-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "c7a63ccec313159d5bccd39763f14eeada4c3454";
        hash = "sha256-YS/dbv5bFEo0e6p2S2K0wYH6sO3R9uAcBsstWxGi/qI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_robot_sim_common";
  version = "2.4.0-1";
  src = sources.rmf_robot_sim_common;
  nativeBuildInputs = [ ament_cmake eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rclcpp rmf_building_map_msgs rmf_dispenser_msgs rmf_fleet_msgs rmf_ingestor_msgs std_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Common utility functions for Gazebo-classic and Gazebo RMF plugins";
  };
}
