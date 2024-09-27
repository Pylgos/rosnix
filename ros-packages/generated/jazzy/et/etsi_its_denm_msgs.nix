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
    etsi_its_denm_msgs-6a71d862771e7b23c8b711b1f24b4a73b41cb22a = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_msgs-6a71d862771e7b23c8b711b1f24b4a73b41cb22a-source";
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
  src = sources.etsi_its_denm_msgs-6a71d862771e7b23c8b711b1f24b4a73b41cb22a;
  nativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS messages for ETSI ITS DENM";
  };
}
