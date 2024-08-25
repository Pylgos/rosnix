{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    marti_can_msgs = substituteSource {
      src = fetchgit {
        name = "marti_can_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "a956349bfa786d8fdd97fbda6d5607ac39d7591e";
        hash = "sha256-5VPwc7nPPY/in4KBeeRNGCcR6NVi2Fu0OccVKxlf31E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_can_msgs";
  version = "1.6.0-1";
  src = sources.marti_can_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "marti_can_msgs";
  };
}
