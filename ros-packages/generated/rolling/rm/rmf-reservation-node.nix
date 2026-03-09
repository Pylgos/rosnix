{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmf-building-map-msgs,
  rmf-fleet-adapter,
  rmf-reservation-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_reservation_node";
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."rmf_reservation_node";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rmf-building-map-msgs rmf-fleet-adapter rmf-reservation-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rmf-building-map-msgs rmf-fleet-adapter rmf-reservation-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_reservation_node" = substituteSource {
      src = fetchgit {
        name = "rmf_reservation_node-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "6cfe5e3a835b0aac072cc60c47576e34b29699b9";
        hash = "sha256-179GFH0K2sm9XdGQzgFZh1lntF3zIjUyWkVmIoLPRFg=";
      };
    };
  });
  meta = {
    description = "Node that handles current state of parking spots.";
  };
})
