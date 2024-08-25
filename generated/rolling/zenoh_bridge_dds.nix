{
  ament_cmake,
  buildRosPackage,
  cargo,
  clang,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    zenoh_bridge_dds = substituteSource {
      src = fetchgit {
        name = "zenoh_bridge_dds-source";
        url = "https://github.com/ros2-gbp/zenoh_bridge_dds-release.git";
        rev = "ae9f3eba9d4ad512dc69d75605e4e046d0617b92";
        hash = "sha256-f7l+qyV5vSYtTVBV57bVQUV49odL51NPVkvmo00gimY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zenoh_bridge_dds";
  version = "0.5.0-4";
  src = sources.zenoh_bridge_dds;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ clang ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cargo ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Bridge between ROS2/DDS and Eclipse zenoh (https://zenoh.io). It allows the integration of zenoh applications with ROS2, or the tunneling of ROS2 communications between nodes via the zenoh protocol at Internet scale.";
  };
}
