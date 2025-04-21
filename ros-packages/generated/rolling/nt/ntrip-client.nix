{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nmea-msgs,
  rclpy,
  rosSystemPackages,
  rtcm-msgs,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ntrip_client";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."ntrip_client";
  propagatedBuildInputs = [ nmea-msgs rclpy rtcm-msgs sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-serial" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ntrip_client" = substituteSource {
      src = fetchgit {
        name = "ntrip_client-source";
        url = "https://github.com/ros2-gbp/ntrip_client-release.git";
        rev = "4bb0296101bbb6483d9b0bea374c0535b1fe12d7";
        hash = "sha256-baBmRfB8U2r2GQsjFg9naaGaqtg1Iv3l080W10IXZM0=";
      };
    };
  });
  meta = {
    description = "NTRIP client that will publish RTCM corrections to a ROS topic, and optionally subscribe to NMEA messages to send to an NTRIP server";
  };
})
