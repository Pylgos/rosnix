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
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."rmf_demos_tasks";
  propagatedBuildInputs = [ rmf-dispenser-msgs rmf-fleet-msgs rmf-lift-msgs rmf-task-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_tasks" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_tasks-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "965b449bbe04da213466a665f739d717be6046b1";
        hash = "sha256-eDd0flwBdlceKhJO0zRUKxLKUvwagZGLbSUpUSlnaCE=";
      };
    };
  });
  meta = {
    description = "A package containing scripts for demos";
  };
})
