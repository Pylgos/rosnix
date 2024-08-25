{
  ament_cmake,
  buildRosPackage,
  etsi_its_coding,
  etsi_its_conversion,
  etsi_its_msgs,
  etsi_its_msgs_utils,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    etsi_its_messages = substituteSource {
      src = fetchgit {
        name = "etsi_its_messages-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "8810ffc2df7167070ba7ac4ab13a9dc70c12318b";
        hash = "sha256-QHsYXaoQtrrQI1SbTnilTHgSaSRPOt/6QxDK7LeHiMc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_messages";
  version = "2.2.0-1";
  src = sources.etsi_its_messages;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ etsi_its_coding etsi_its_conversion etsi_its_msgs etsi_its_msgs_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS support for ETSI ITS messages";
  };
}
