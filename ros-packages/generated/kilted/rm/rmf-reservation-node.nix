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
  version = "2.10.1-1";
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
        rev = "c6a9111db5159cab621d0b0a279478c160593c71";
        hash = "sha256-+6kE1rRuro9joYlEY7ZAyii0LuJHNNvfskGxfnYSbt8=";
      };
    };
  });
  meta = {
    description = "Node that handles current state of parking spots.";
  };
})
