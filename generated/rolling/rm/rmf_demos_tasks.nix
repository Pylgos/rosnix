{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rmf_dispenser_msgs,
  rmf_fleet_msgs,
  rmf_lift_msgs,
  rmf_task_msgs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmf_demos_tasks = substituteSource {
      src = fetchgit {
        name = "rmf_demos_tasks-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "0ac70379ac838be7c222eec8f4b836b959492fad";
        hash = "sha256-3GevTHW5mJ/zW59UVfvwQR5SZ87Y7mKFfBbV2Ajz/DU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_demos_tasks";
  version = "2.4.0-1";
  src = sources.rmf_demos_tasks;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rmf_dispenser_msgs rmf_fleet_msgs rmf_lift_msgs rmf_task_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing scripts for demos";
  };
}
