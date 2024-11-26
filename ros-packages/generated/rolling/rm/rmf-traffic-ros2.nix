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
  rclcpp,
  rmf-building-map-msgs,
  rmf-fleet-msgs,
  rmf-site-map-msgs,
  rmf-traffic,
  rmf-traffic-msgs,
  rmf-utils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_traffic_ros2";
  version = "2.7.1-1";
  src = finalAttrs.passthru.sources."rmf_traffic_ros2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros rclcpp rmf-building-map-msgs rmf-fleet-msgs rmf-site-map-msgs rmf-traffic rmf-traffic-msgs rmf-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "nlohmann-json-dev" "proj" "uuid" "yaml-cpp" "zlib" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_traffic_ros2" = substituteSource {
        src = fetchgit {
          name = "rmf_traffic_ros2-source";
          url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
          rev = "8fe01ade5f770221dc54219ee829cd4c0d071408";
          hash = "sha256-bIH0kmEEfv2YrjgqN0A03ExlFiNeb1mTtBYDbKXLttg=";
        };
      };
    });
  };
  meta = {
    description = "A package containing messages used by the RMF traffic management system.";
  };
})
