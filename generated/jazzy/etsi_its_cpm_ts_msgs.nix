{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    etsi_its_cpm_ts_msgs = substituteSource {
      src = fetchgit {
        name = "etsi_its_cpm_ts_msgs-source";
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
  src = sources.etsi_its_cpm_ts_msgs;
  nativeBuildInputs = [ rosidl_default_generators ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS messages for ETSI ITS CPM (TS)";
  };
}
