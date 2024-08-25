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
    marti_introspection_msgs = substituteSource {
      src = fetchgit {
        name = "marti_introspection_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "ab01638128d1cc0fb3605c62aba4ab59f04cc794";
        hash = "sha256-G3Qj8QUW/R3mViTi8sg6WdfKAO4IYQz6TNCybFTH3yw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_introspection_msgs";
  version = "1.6.0-1";
  src = sources.marti_introspection_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "marti_introspection_msgs";
  };
}
