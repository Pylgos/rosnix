{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    marti_visualization_msgs = substituteSource {
      src = fetchgit {
        name = "marti_visualization_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "139ad17010b99023f9040ea39ea4fd698d30a071";
        hash = "sha256-J/e6UywxedOfu1RqMp/WkkqctJn+Mt3DNpdgReSPZMY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_visualization_msgs";
  version = "1.6.0-1";
  src = sources.marti_visualization_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "marti_visualization_msgs";
  };
}
