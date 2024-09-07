{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    marti_sensor_msgs = substituteSource {
      src = fetchgit {
        name = "marti_sensor_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "f1ef8219a28db83f909557e0db9cebf3e996a93f";
        hash = "sha256-waPgK4Yx5LSjfVSvjvq9aI0o3wfx0K+KxSkCs103PhM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_sensor_msgs";
  version = "1.6.1-1";
  src = sources.marti_sensor_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "marti_sensor_msgs";
  };
}
