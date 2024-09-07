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
        rev = "17885ffb343ff0f31797279aa61e9f0123773509";
        hash = "sha256-UXkL8nLeSUw2UtfM+OmwG+nVy6UgHvo+FUNAnEyzdvA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_can_msgs";
  version = "1.6.1-1";
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
