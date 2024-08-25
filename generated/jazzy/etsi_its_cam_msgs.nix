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
    etsi_its_cam_msgs = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "1a9abcfd91b21441b1873c0c6bef0303f3135efe";
        hash = "sha256-zkiUTEJ/tmPAlUKx1CJD4yluVwkDm44D5uHtfZWveAE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_cam_msgs";
  version = "2.2.0-1";
  src = sources.etsi_its_cam_msgs;
  nativeBuildInputs = [ rosidl_default_generators ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS messages for ETSI ITS CAM";
  };
}
