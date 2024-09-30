{
  ament-cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  mkSourceSet,
  moveit-resources-prbt-ikfast-manipulator-plugin,
  moveit-resources-prbt-support,
  moveit-ros-move-group,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = mkSourceSet (sources: {
    "moveit_resources_prbt_moveit_config" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "a908453a73c0fa47f86cf0fed06767778c05fef2";
        hash = "sha256-tkXqraDt7iURYP8Cu9Gw0UL3MGWQFkj34yRTM2w6zmc=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "moveit_resources_prbt_moveit_config";
  version = "2.11.0-1";
  src = sources."moveit_resources_prbt_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ joint-state-publisher moveit-resources-prbt-ikfast-manipulator-plugin moveit-resources-prbt-support moveit-ros-move-group robot-state-publisher rviz2 xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "";
  };
}
