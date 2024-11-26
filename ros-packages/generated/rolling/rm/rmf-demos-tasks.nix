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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."rmf_demos_tasks";
  propagatedBuildInputs = [ rmf-dispenser-msgs rmf-fleet-msgs rmf-lift-msgs rmf-task-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_tasks" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_tasks-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "0ac70379ac838be7c222eec8f4b836b959492fad";
        hash = "sha256-3GevTHW5mJ/zW59UVfvwQR5SZ87Y7mKFfBbV2Ajz/DU=";
      };
    };
  });
  meta = {
    description = "A package containing scripts for demos";
  };
})
