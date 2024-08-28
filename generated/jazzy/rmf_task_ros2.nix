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
  nlohmann_json,
  nlohmann_json_schema_validator_vendor,
  rclcpp,
  rmf_api_msgs,
  rmf_task_msgs,
  rmf_traffic,
  rmf_traffic_ros2,
  rmf_utils,
  rmf_websocket,
  substituteSource,
}:
let
  sources = rec {
    rmf_task_ros2 = substituteSource {
      src = fetchgit {
        name = "rmf_task_ros2-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "21db0de84f77d1e6e627636c77600231c582df64";
        hash = "sha256-g2F060KdE6F9gJut0a9HaEVWpiXe0Qe1ao27SICYYkw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_task_ros2";
  version = "2.7.2-1";
  src = sources.rmf_task_ros2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros eigen nlohmann_json nlohmann_json_schema_validator_vendor rclcpp rmf_api_msgs rmf_task_msgs rmf_traffic rmf_traffic_ros2 rmf_utils rmf_websocket ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_catch2 ament_cmake_uncrustify ];
  missingDependencies = [  ];
  meta = {
    description = "A package managing the dispatching of tasks in RMF system.";
  };
}
