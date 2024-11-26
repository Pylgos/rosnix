{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_msgs_utils";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_msgs_utils";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ etsi-its-msgs geometry-msgs tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "geographiclib" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "etsi_its_msgs_utils" = substituteSource {
        src = fetchgit {
          name = "etsi_its_msgs_utils-source";
          url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
          rev = "52d8e6f14188aedac41c59ae1579c4536e352865";
          hash = "sha256-ALOB2te3iV7edM+Oq3d10Z1VZ+xDRKtKlgiOuyeVPiE=";
        };
      };
    });
  };
  meta = {
    description = "ROS messages and utility functions for ETSI ITS messages";
  };
})
