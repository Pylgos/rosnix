{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nmea_msgs,
  rclpy,
  rtcm_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ntrip_client = substituteSource {
      src = fetchgit {
        name = "ntrip_client-source";
        url = "https://github.com/ros2-gbp/ntrip_client-release.git";
        rev = "c3ee956ac42a9068a5941b9c23b8c3ece666aacc";
        hash = "sha256-mjgvoEVgfLQBBMLRNOu0vuIREhBqOf96dPTY2PVPqV0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ntrip_client";
  version = "1.3.0-2";
  src = sources.ntrip_client;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nmea_msgs rclpy rtcm_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "NTRIP client that will publish RTCM corrections to a ROS topic, and optionally subscribe to NMEA messages to send to an NTRIP server";
  };
}
