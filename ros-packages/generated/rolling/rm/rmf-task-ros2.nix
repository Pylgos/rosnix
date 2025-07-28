{
  ament-cmake,
  ament-cmake-catch2,
  ament-cmake-uncrustify,
  backward-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nlohmann-json-schema-validator-vendor,
  rclcpp,
  rmf-api-msgs,
  rmf-task-msgs,
  rmf-traffic,
  rmf-traffic-ros2,
  rmf-utils,
  rmf-websocket,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_task_ros2";
  version = "2.11.1-1";
  src = finalAttrs.passthru.sources."rmf_task_ros2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros nlohmann-json-schema-validator-vendor rclcpp rmf-api-msgs rmf-task-msgs rmf-traffic rmf-traffic-ros2 rmf-utils rmf-websocket std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros nlohmann-json-schema-validator-vendor rclcpp rmf-api-msgs rmf-task-msgs rmf-traffic rmf-traffic-ros2 rmf-utils rmf-websocket std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_task_ros2" = substituteSource {
      src = fetchgit {
        name = "rmf_task_ros2-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "53bc808c982435967074326a6a1d2eec8a155fc7";
        hash = "sha256-rU1ybOrUI7gtgKwAVx6kiV/JeWjC33pFXHLfWzfJIOI=";
      };
    };
  });
  meta = {
    description = "A package managing the dispatching of tasks in RMF system.";
  };
})
