{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    etsi_its_cpm_ts_msgs-b2a202a558cdeba3b449d1fbd7f1c96c2ca31441 = substituteSource {
      src = fetchgit {
        name = "etsi_its_cpm_ts_msgs-b2a202a558cdeba3b449d1fbd7f1c96c2ca31441-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "b2a202a558cdeba3b449d1fbd7f1c96c2ca31441";
        hash = "sha256-JcdhmFst8/P61Bx6NfSj3fj97cbeKlO1/8vMLmCWAzQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_cpm_ts_msgs";
  version = "2.2.0-1";
  src = sources.etsi_its_cpm_ts_msgs-b2a202a558cdeba3b449d1fbd7f1c96c2ca31441;
  nativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS messages for ETSI ITS CPM (TS)";
  };
}
