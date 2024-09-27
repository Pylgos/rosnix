{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    marti_visualization_msgs-306f1d7c798f4bbb2d3c8bbdf5a2e9bce4d638a3 = substituteSource {
      src = fetchgit {
        name = "marti_visualization_msgs-306f1d7c798f4bbb2d3c8bbdf5a2e9bce4d638a3-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "306f1d7c798f4bbb2d3c8bbdf5a2e9bce4d638a3";
        hash = "sha256-YNsCs5+k+7cvdOc35aJo5NeZfXvNOqSFDlyGbWKeW7o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_visualization_msgs";
  version = "1.6.1-1";
  src = sources.marti_visualization_msgs-306f1d7c798f4bbb2d3c8bbdf5a2e9bce4d638a3;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "marti_visualization_msgs";
  };
}
