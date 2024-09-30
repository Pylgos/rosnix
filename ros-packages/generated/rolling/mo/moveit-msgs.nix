{
  action-msgs,
  ament-cmake,
  ament-lint-auto,
  ament-lint-cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  object-recognition-msgs,
  octomap-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  shape-msgs,
  std-msgs,
  substituteSource,
  trajectory-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "moveit_msgs" = substituteSource {
      src = fetchgit {
        name = "moveit_msgs-source";
        url = "https://github.com/ros2-gbp/moveit_msgs-release.git";
        rev = "0daba4a04b95f58faeb7fecc078126948195df1f";
        hash = "sha256-eWWWhKKdKRwr1U0N2bGllNmgC2EzT0l5DNKFFjjXAYI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "moveit_msgs";
  version = "2.6.0-1";
  src = sources."moveit_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action-msgs geometry-msgs object-recognition-msgs octomap-msgs rosidl-default-runtime sensor-msgs shape-msgs std-msgs trajectory-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Messages, services and actions used by MoveIt";
  };
}
