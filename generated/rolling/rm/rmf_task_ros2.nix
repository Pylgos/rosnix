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
    rmf_task_ros2-9f37183b93bd07ce2bacb4e6d53e00760ac2e712 = substituteSource {
      src = fetchgit {
        name = "rmf_task_ros2-9f37183b93bd07ce2bacb4e6d53e00760ac2e712-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "9f37183b93bd07ce2bacb4e6d53e00760ac2e712";
        hash = "sha256-y4IbNVcDULlvcjtuE8/Dathrhp5jp0KhAL6yEiWehpE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_task_ros2";
  version = "2.7.1-1";
  src = sources.rmf_task_ros2-9f37183b93bd07ce2bacb4e6d53e00760ac2e712;
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
