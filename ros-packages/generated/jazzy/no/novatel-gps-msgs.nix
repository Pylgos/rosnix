{
  ament-cmake,
  buildAmentCmakePackage,
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
  pname = "novatel_gps_msgs";
  version = "4.2.0-1";
  src = finalAttrs.passthru.sources."novatel_gps_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "novatel_gps_msgs" = substituteSource {
      src = fetchgit {
        name = "novatel_gps_msgs-source";
        url = "https://github.com/ros2-gbp/novatel_gps_driver-release.git";
        rev = "1133d8a3f052a9e8f8c846c8ee00f7863b31fbb6";
        hash = "sha256-lpfr1W/b25fBZyVBfOIIfoO7Bc5NjgdnlwVK62AaTeA=";
      };
    };
  });
  meta = {
    description = "Messages for proprietary (non-NMEA) sentences from Novatel GPS receivers.";
  };
})
