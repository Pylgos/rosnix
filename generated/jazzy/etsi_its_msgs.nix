{
  ament_cmake,
  buildRosPackage,
  etsi_its_cam_msgs,
  etsi_its_cam_ts_msgs,
  etsi_its_cpm_ts_msgs,
  etsi_its_denm_msgs,
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
    etsi_its_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "etsi_its_msgs-source";
        owner = "ros2-gbp";
        repo = "etsi_its_messages-release";
        rev = "9f7b31de624de641f11f1d0f6087b6768dce05ab";
        hash = "sha256-iXaUxaXuD+F1ZqEOHM7lamsObfoWjXRn6dEWcv+EYAU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_msgs";
  version = "2.2.0-1";
  src = sources.etsi_its_msgs;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ etsi_its_cam_msgs etsi_its_cam_ts_msgs etsi_its_cpm_ts_msgs etsi_its_denm_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS messages for ETSI ITS messages";
  };
}
