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
  version = "4.2.0-5";
  src = finalAttrs.passthru.sources."novatel_gps_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "novatel_gps_msgs" = substituteSource {
      src = fetchgit {
        name = "novatel_gps_msgs-source";
        url = "https://github.com/ros2-gbp/novatel_gps_driver-release.git";
        rev = "fe0643dc23cc7667856b93f9b0b9f0a5cf3541ce";
        hash = "sha256-lpfr1W/b25fBZyVBfOIIfoO7Bc5NjgdnlwVK62AaTeA=";
      };
    };
  });
  meta = {
    description = "\n  Messages for proprietary (non-NMEA) sentences from Novatel GPS receivers.\n  ";
  };
})
