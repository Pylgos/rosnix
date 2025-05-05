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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_task_ros2";
  version = "2.7.2-1";
  src = finalAttrs.passthru.sources."rmf_task_ros2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros nlohmann-json-schema-validator-vendor rclcpp rmf-api-msgs rmf-task-msgs rmf-traffic rmf-traffic-ros2 rmf-utils rmf-websocket ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros nlohmann-json-schema-validator-vendor rclcpp rmf-api-msgs rmf-task-msgs rmf-traffic rmf-traffic-ros2 rmf-utils rmf-websocket ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_task_ros2" = substituteSource {
      src = fetchgit {
        name = "rmf_task_ros2-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "21db0de84f77d1e6e627636c77600231c582df64";
        hash = "sha256-g2F060KdE6F9gJut0a9HaEVWpiXe0Qe1ao27SICYYkw=";
      };
    };
  });
  meta = {
    description = "A package managing the dispatching of tasks in RMF system.";
  };
})
