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
  version = "2.9.0-1";
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
        rev = "83722c879bafa0b142c33af0162aaeee09337a49";
        hash = "sha256-feJkv0suT9PdFzE2v0zNfH1d28nI+qgDCIB4CMMpGK4=";
      };
    };
  });
  meta = {
    description = "Node that handles current state of parking spots.";
  };
})
