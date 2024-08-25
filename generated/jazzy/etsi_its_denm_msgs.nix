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
    etsi_its_denm_msgs = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "6a71d862771e7b23c8b711b1f24b4a73b41cb22a";
        hash = "sha256-fCRMLexkcOPlbaT2MXTyAn+/J6IfOq3DzjBBcuryynU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_denm_msgs";
  version = "2.2.0-1";
  src = sources.etsi_its_denm_msgs;
  nativeBuildInputs = [ rosidl_default_generators ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS messages for ETSI ITS DENM";
  };
}
