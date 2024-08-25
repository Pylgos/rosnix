{
  ament_cmake,
  buildRosPackage,
  dataspeed_can_msg_filters,
  dataspeed_can_msgs,
  dataspeed_can_tools,
  dataspeed_can_usb,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    dataspeed_can = substituteSource {
      src = fetchgit {
        name = "dataspeed_can-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "215fd5105f5b84039373012493bfb6c49316b6c3";
        hash = "sha256-9p4ziWt8ief6N+GFSFlNIRqrz/HfSNqpIR7/UtwU6aI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dataspeed_can";
  version = "2.0.4-1";
  src = sources.dataspeed_can;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dataspeed_can_msg_filters dataspeed_can_msgs dataspeed_can_tools dataspeed_can_usb ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "CAN bus tools using Dataspeed hardware";
  };
}
