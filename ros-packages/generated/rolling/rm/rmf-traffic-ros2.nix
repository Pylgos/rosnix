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
  version = "2.11.1-1";
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
        rev = "34dd973c91aa86ac5ffa5ed97232a96dc8d4053e";
        hash = "sha256-SIMP05cxmw2oD40oEk0w5iGlIk41UC3R08OsvHg7GxE=";
      };
    };
  });
  meta = {
    description = "A package containing messages used by the RMF traffic management system.";
  };
})
