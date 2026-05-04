{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmf-dispenser-msgs,
  rmf-fleet-msgs,
  rmf-lift-msgs,
  rmf-task-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rmf_demos_tasks";
  version = "2.8.2-3";
  src = finalAttrs.passthru.sources."rmf_demos_tasks";
  propagatedNativeBuildInputs = [ rmf-dispenser-msgs rmf-fleet-msgs rmf-lift-msgs rmf-task-msgs ];
  propagatedBuildInputs = [ rmf-dispenser-msgs rmf-fleet-msgs rmf-lift-msgs rmf-task-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_tasks" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_tasks-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "4a9812f9be1d2c2239a8680b3a7415649fe3a252";
        hash = "sha256-FOIArk2TAc+0OXVahSR6uFl5loR79wmAniaR3GefBj4=";
      };
    };
  });
  meta = {
    description = "A package containing scripts for demos";
  };
})
