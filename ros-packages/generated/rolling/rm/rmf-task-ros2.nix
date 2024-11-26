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
  version = "2.7.1-1";
  src = finalAttrs.passthru.sources."rmf_task_ros2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros nlohmann-json-schema-validator-vendor rclcpp rmf-api-msgs rmf-task-msgs rmf-traffic rmf-traffic-ros2 rmf-utils rmf-websocket ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_task_ros2" = substituteSource {
        src = fetchgit {
          name = "rmf_task_ros2-source";
          url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
          rev = "9f37183b93bd07ce2bacb4e6d53e00760ac2e712";
          hash = "sha256-y4IbNVcDULlvcjtuE8/Dathrhp5jp0KhAL6yEiWehpE=";
        };
      };
    });
  };
  meta = {
    description = "A package managing the dispatching of tasks in RMF system.";
  };
})
