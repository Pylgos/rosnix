{
  ament-cmake,
  buildRosPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "marti_visualization_msgs" = substituteSource {
      src = fetchgit {
        name = "marti_visualization_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "d58be137efd71fda87644de7876c1c4ac20a2df0";
        hash = "sha256-YNsCs5+k+7cvdOc35aJo5NeZfXvNOqSFDlyGbWKeW7o=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "marti_visualization_msgs";
  version = "1.6.1-1";
  src = sources."marti_visualization_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "marti_visualization_msgs";
  };
}
