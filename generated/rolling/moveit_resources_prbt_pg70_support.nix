{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_resources_prbt_ikfast_manipulator_plugin,
  moveit_resources_prbt_moveit_config,
  moveit_resources_prbt_support,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    moveit_resources_prbt_pg70_support = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_pg70_support-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "f4cb26ce19c530b28cad7fb434df307d94c7cdbf";
        hash = "sha256-ChdyKCb3jx8wp4q/LC4M9me9rV6zIVHbqHsrZ0O8kmE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_prbt_pg70_support";
  version = "2.10.0-1";
  src = sources.moveit_resources_prbt_pg70_support;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_resources_prbt_ikfast_manipulator_plugin moveit_resources_prbt_moveit_config moveit_resources_prbt_support xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "PRBT support for Schunk pg70 gripper.";
  };
}
