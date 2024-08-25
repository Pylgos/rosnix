{
  ament_cmake,
  buildRosPackage,
  etsi_its_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geographiclib,
  geometry_msgs,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    etsi_its_msgs_utils = substituteSource {
      src = fetchgit {
        name = "etsi_its_msgs_utils-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "d0c358b4a8bc6ab2d51f4350621a7ed0668835fd";
        hash = "sha256-s7PhbM4SnhusmUCCG8ug/MWgO4ldBUnvw4HkyS4/jwE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_msgs_utils";
  version = "2.2.0-1";
  src = sources.etsi_its_msgs_utils;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ etsi_its_msgs geographiclib geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS messages and utility functions for ETSI ITS messages";
  };
}
