{
  ament_cmake,
  buildRosPackage,
  etsi_its_cam_ts_coding,
  etsi_its_cam_ts_msgs,
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
    "etsi_its_cam_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "f077c3dd1700aba761bac25ea82ffaa33940d627";
        hash = "sha256-qwuR2yAC0YqNGFmo2DQSsunBWTaRxlPoaz7+lFnkwiQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "etsi_its_cam_ts_conversion";
  version = "2.2.0-1";
  src = sources."etsi_its_cam_ts_conversion";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ etsi_its_cam_ts_coding etsi_its_cam_ts_msgs etsi_its_primitives_conversion ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS CAMs (TS)";
  };
}