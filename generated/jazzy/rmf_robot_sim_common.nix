{
  ament_cmake,
  buildRosPackage,
  eigen,
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
        rev = "11fbc3b5f59f867be3c8a00b4e354fa600198ea0";
        hash = "sha256-w0qFx4C5VaFH20/vYzf/UCmQRb9mrIetgO+qmcmffcw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_robot_sim_common";
  version = "2.3.2-1";
  src = sources.rmf_robot_sim_common;
  nativeBuildInputs = [ ament_cmake eigen3_cmake_module ];
  propagatedNativeBuildInputs = [ eigen ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclcpp rmf_building_map_msgs rmf_dispenser_msgs rmf_fleet_msgs rmf_ingestor_msgs std_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Common utility functions for Gazebo-classic and Gazebo RMF plugins";
  };
}
