{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    marti_perception_msgs = substituteSource {
      src = fetchgit {
        name = "marti_perception_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "6836b2653bdb97e1f3c0aa9cd776d64e18a8cf32";
        hash = "sha256-1ftlmmmscLXIcm4yEVljfs3/eDlxSHJON8yi8p55zDo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_perception_msgs";
  version = "1.6.0-1";
  src = sources.marti_perception_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "marti_perception_msgs";
  };
}
