{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ublox_serialization = substituteSource {
      src = fetchgit {
        name = "ublox_serialization-source";
        url = "https://github.com/ros2-gbp/ublox-release.git";
        rev = "85717ac55a1696788eb7d8b2e85a01c76f471781";
        hash = "sha256-b2kP01irILk8Ct0RNRYsczUU7sgdAugMNejSpNFPdGE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox_serialization";
  version = "2.3.0-4";
  src = sources.ublox_serialization;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ublox_serialization provides header files for serialization of ROS messages to and from u-blox message format.";
  };
}
