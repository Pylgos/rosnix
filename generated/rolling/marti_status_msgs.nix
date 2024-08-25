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
    marti_status_msgs = substituteSource {
      src = fetchgit {
        name = "marti_status_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "4755c0cc38b97b00929a8ffd690466a704c3ae52";
        hash = "sha256-mx5D4M9vAPRyK4UiefztaWF2hKFeMH2lfEJfq/pVk9U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_status_msgs";
  version = "1.6.0-1";
  src = sources.marti_status_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "marti_status_msgs";
  };
}
