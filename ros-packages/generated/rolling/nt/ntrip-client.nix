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
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ntrip_client";
  version = "1.3.0-2";
  src = finalAttrs.passthru.sources."ntrip_client";
  propagatedBuildInputs = [ nmea-msgs rclpy rtcm-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ntrip_client" = substituteSource {
      src = fetchgit {
        name = "ntrip_client-source";
        url = "https://github.com/ros2-gbp/ntrip_client-release.git";
        rev = "c3ee956ac42a9068a5941b9c23b8c3ece666aacc";
        hash = "sha256-mjgvoEVgfLQBBMLRNOu0vuIREhBqOf96dPTY2PVPqV0=";
      };
    };
  });
  meta = {
    description = "NTRIP client that will publish RTCM corrections to a ROS topic, and optionally subscribe to NMEA messages to send to an NTRIP server";
  };
})
