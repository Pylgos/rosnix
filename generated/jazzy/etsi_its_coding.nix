{
  ament_cmake,
  buildRosPackage,
  etsi_its_cam_coding,
  etsi_its_cam_ts_coding,
  etsi_its_cpm_ts_coding,
  etsi_its_denm_coding,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    etsi_its_coding = substituteSource {
      src = fetchgit {
        name = "etsi_its_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "d492d86f12ec39ad78bb9a818dcf82412dc40b42";
        hash = "sha256-3tNcNicduSIgaMO0w56P9JndUg4DzJ2+BiO5hvEemYs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_coding";
  version = "2.2.0-1";
  src = sources.etsi_its_coding;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ etsi_its_cam_coding etsi_its_cam_ts_coding etsi_its_cpm_ts_coding etsi_its_denm_coding ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "C++ compatible C source code for ETSI ITS messages generated from ASN.1 using asn1c";
  };
}
