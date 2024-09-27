{
  ament_cmake,
  buildRosPackage,
  etsi_its_denm_coding,
  etsi_its_denm_msgs,
  etsi_its_primitives_conversion,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "etsi_its_denm_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "28f55eda118ffd3d526032fb4b711b436b01f111";
        hash = "sha256-+7UxfhxlZUpNRycs8KsytG+qmcQ4MnY/kNVPUf0kRz8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "etsi_its_denm_conversion";
  version = "2.2.0-1";
  src = sources."etsi_its_denm_conversion";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ etsi_its_denm_coding etsi_its_denm_msgs etsi_its_primitives_conversion ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS DENMs";
  };
}
