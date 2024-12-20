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
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."ntrip_client";
  propagatedBuildInputs = [ nmea-msgs rclpy rtcm-msgs sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-serial" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ntrip_client" = substituteSource {
      src = fetchgit {
        name = "ntrip_client-source";
        url = "https://github.com/ros2-gbp/ntrip_client-release.git";
        rev = "ca7f4f1b38126f706a97107fd1e550adbc757bb1";
        hash = "sha256-y4y0O6K9sc8V289vd1b7H5Pc9/uWSpJGhGL7Sw0wMos=";
      };
    };
  });
  meta = {
    description = "NTRIP client that will publish RTCM corrections to a ROS topic, and optionally subscribe to NMEA messages to send to an NTRIP server";
  };
})
