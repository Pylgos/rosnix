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
  rmf-reservation-msgs,
  rmf-site-map-msgs,
  rmf-traffic,
  rmf-traffic-msgs,
  rmf-utils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_traffic_ros2";
  version = "2.10.1-1";
  src = finalAttrs.passthru.sources."rmf_traffic_ros2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros rclcpp rmf-building-map-msgs rmf-fleet-msgs rmf-reservation-msgs rmf-site-map-msgs rmf-traffic rmf-traffic-msgs rmf-utils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "nlohmann-json-dev" "proj" "uuid" "yaml-cpp" "zlib" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros rclcpp rmf-building-map-msgs rmf-fleet-msgs rmf-reservation-msgs rmf-site-map-msgs rmf-traffic rmf-traffic-msgs rmf-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "nlohmann-json-dev" "proj" "uuid" "yaml-cpp" "zlib" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_ros2" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_ros2-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "870f4eb12768fdfc1384e0945924c6fa4b9bd1a2";
        hash = "sha256-VtWmnbqSvEZqRz1O9/RN8k5pj0Id/39Z0u9ZTz4Ow5s=";
      };
    };
  });
  meta = {
    description = "A package containing messages used by the RMF traffic management system.";
  };
})
