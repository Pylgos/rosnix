{
  ament-cmake,
  ament-cmake-uncrustify,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rmf-traffic,
  rmf-traffic-msgs,
  rmf-traffic-ros2,
  rmf-utils,
  rmf-visualization-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_visualization_schedule";
  version = "2.3.2-1";
  src = finalAttrs.passthru.sources."rmf_visualization_schedule";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rclcpp rclcpp-components rmf-traffic rmf-traffic-msgs rmf-traffic-ros2 rmf-visualization-msgs rosidl-default-generators visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libboost-dev" "libssl-dev" "libwebsocketpp-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclcpp rclcpp-components rmf-traffic rmf-traffic-msgs rmf-traffic-ros2 rmf-visualization-msgs rosidl-default-generators visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libboost-dev" "libssl-dev" "libwebsocketpp-dev" ]; };
  checkInputs = [ ament-cmake-uncrustify ament-lint-auto ament-lint-common rmf-utils ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_visualization_schedule" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_schedule-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "4aa4ddacce52315f98211824e219ce9c983b599d";
        hash = "sha256-2SvzpAD0Uei7K1eYXbcIRujC09Ra/c1aC/c6Ab59Yho=";
      };
    };
  });
  meta = {
    description = "A visualizer for trajectories in rmf schedule";
  };
})
