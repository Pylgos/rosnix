{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    swri_serial_util = substituteSource {
      src = fetchgit {
        name = "swri_serial_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "6c000a6467f30df349d9124d6345f406cb39db0a";
        hash = "sha256-pP1hfS0TGi+AyrxNkeqYyPtGArku1qje6zQr/8Lcx7s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_serial_util";
  version = "3.7.1-1";
  src = sources.swri_serial_util;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Contains nodes and utilities for serial communication in ROS.";
  };
}
