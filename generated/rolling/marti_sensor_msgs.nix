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
        rev = "c09289d59f749861b970a8b1d93b3ca41dab64c5";
        hash = "sha256-xd8dEVVxSHB0XnP1jk794B9SIBUb37aHoVptiBHGZe8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_sensor_msgs";
  version = "1.6.0-1";
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
