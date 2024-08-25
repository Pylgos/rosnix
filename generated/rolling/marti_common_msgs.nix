{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
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
    marti_common_msgs = substituteSource {
      src = fetchgit {
        name = "marti_common_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "dbb13e468d9894f799fa4c5050f8aeaaa4cd7192";
        hash = "sha256-W3b9iV22vd3wh08lBnZhgtMWw1Q6EsMvtdSMKadlgHw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_common_msgs";
  version = "1.6.0-1";
  src = sources.marti_common_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "marti_common_msgs";
  };
}
