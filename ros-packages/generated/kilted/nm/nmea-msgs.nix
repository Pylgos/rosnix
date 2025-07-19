{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nmea_msgs";
  version = "2.1.0-3";
  src = finalAttrs.passthru.sources."nmea_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "nmea_msgs" = substituteSource {
      src = fetchgit {
        name = "nmea_msgs-source";
        url = "https://github.com/ros2-gbp/nmea_msgs-release.git";
        rev = "eb1055b6e660ea46b727cf4adffac804a42cb551";
        hash = "sha256-bLkC+tkA0cqER/1WKKbOYYYpOp96t3ZNxVS5VgFVYOE=";
      };
    };
  });
  meta = {
    description = "The nmea_msgs package contains messages related to data in the NMEA format.";
  };
})
