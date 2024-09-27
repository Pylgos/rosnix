{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_resources_prbt_ikfast_manipulator_plugin,
  moveit_resources_prbt_moveit_config,
  moveit_resources_prbt_support,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    moveit_resources_prbt_pg70_support-05cf42e55a4c488d7381854a33466a70e6e453a3 = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_pg70_support-05cf42e55a4c488d7381854a33466a70e6e453a3-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "05cf42e55a4c488d7381854a33466a70e6e453a3";
        hash = "sha256-Jxc/mWLN1KKaB9tAU8zRnz3zT378n7R3PSdRHH4BXl8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_prbt_pg70_support";
  version = "2.11.0-1";
  src = sources.moveit_resources_prbt_pg70_support-05cf42e55a4c488d7381854a33466a70e6e453a3;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ moveit_resources_prbt_ikfast_manipulator_plugin moveit_resources_prbt_moveit_config moveit_resources_prbt_support xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "PRBT support for Schunk pg70 gripper.";
  };
}
