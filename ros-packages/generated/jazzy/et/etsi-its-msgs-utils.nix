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
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_msgs_utils";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-msgs geometry-msgs ros-environment tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "geographiclib" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-msgs geometry-msgs ros-environment tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "geographiclib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_msgs_utils" = substituteSource {
      src = fetchgit {
        name = "etsi_its_msgs_utils-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "521349d2b87e4e91c31fb79a4beedc6b389a39fe";
        hash = "sha256-aqYRnOA1oWGS3HaHfrMqXVhUZRoikdOoc36opUhIHoQ=";
      };
    };
  });
  meta = {
    description = "ROS messages and utility functions for ETSI ITS messages";
  };
})
