{
  ament_cmake,
  buildRosPackage,
  etsi_its_cpm_ts_coding,
  etsi_its_cpm_ts_msgs,
  etsi_its_primitives_conversion,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    etsi_its_cpm_ts_conversion = substituteSource {
      src = fetchFromGitHub {
        name = "etsi_its_cpm_ts_conversion-source";
        owner = "ros2-gbp";
        repo = "etsi_its_messages-release";
        rev = "92bbb5c9773393c415878b5fc03cbd3ddb4f2126";
        hash = "sha256-hzzwrM+Ux6HCi7b1Ocl93n2yAH55fRsQqts/0Llc1n0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_cpm_ts_conversion";
  version = "2.2.0-1";
  src = sources.etsi_its_cpm_ts_conversion;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ etsi_its_cpm_ts_coding etsi_its_cpm_ts_msgs etsi_its_primitives_conversion ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS CPMs (TS)";
  };
}
