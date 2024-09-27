{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    etsi_its_denm_coding-0b6ffb7f07d97aa4e29f8418c69666177fe469e5 = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_coding-0b6ffb7f07d97aa4e29f8418c69666177fe469e5-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "0b6ffb7f07d97aa4e29f8418c69666177fe469e5";
        hash = "sha256-I6oLEte1ltjc9BUHvFrfalPpmhrGi2gMmcwsU2qoZz0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_denm_coding";
  version = "2.2.0-1";
  src = sources.etsi_its_denm_coding-0b6ffb7f07d97aa4e29f8418c69666177fe469e5;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "C++ compatible C source code for ETSI ITS DENMs generated from ASN.1 using asn1c";
  };
}
