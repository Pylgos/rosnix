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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    dataspeed_can-215fd5105f5b84039373012493bfb6c49316b6c3 = substituteSource {
      src = fetchgit {
        name = "dataspeed_can-215fd5105f5b84039373012493bfb6c49316b6c3-source";
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
  src = sources.dataspeed_can-215fd5105f5b84039373012493bfb6c49316b6c3;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ dataspeed_can_msg_filters dataspeed_can_msgs dataspeed_can_tools dataspeed_can_usb ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "CAN bus tools using Dataspeed hardware";
  };
}
