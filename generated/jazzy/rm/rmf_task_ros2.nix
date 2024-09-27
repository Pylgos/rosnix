{
  ament_cmake,
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  backward_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nlohmann_json_schema_validator_vendor,
  rclcpp,
  rmf_api_msgs,
  rmf_task_msgs,
  rmf_traffic,
  rmf_traffic_ros2,
  rmf_utils,
  rmf_websocket,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmf_task_ros2-21db0de84f77d1e6e627636c77600231c582df64 = substituteSource {
      src = fetchgit {
        name = "rmf_task_ros2-21db0de84f77d1e6e627636c77600231c582df64-source";
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
  src = sources.rmf_task_ros2-21db0de84f77d1e6e627636c77600231c582df64;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ backward_ros nlohmann_json_schema_validator_vendor rclcpp rmf_api_msgs rmf_task_msgs rmf_traffic rmf_traffic_ros2 rmf_utils rmf_websocket ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "nlohmann-json-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_catch2 ament_cmake_uncrustify ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package managing the dispatching of tasks in RMF system.";
  };
}
