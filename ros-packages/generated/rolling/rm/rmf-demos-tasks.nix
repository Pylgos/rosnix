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
  version = "2.8.1-2";
  src = finalAttrs.passthru.sources."rmf_demos_tasks";
  propagatedNativeBuildInputs = [ rmf-dispenser-msgs rmf-fleet-msgs rmf-lift-msgs rmf-task-msgs ];
  propagatedBuildInputs = [ rmf-dispenser-msgs rmf-fleet-msgs rmf-lift-msgs rmf-task-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_tasks" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_tasks-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "5f4c3d8f95833238c96953642d3caba1c3ea463f";
        hash = "sha256-UrtaM7XCoYVIYbD6yTKlLYjaxZMLxT8NBELzqhgAI2M=";
      };
    };
  });
  meta = {
    description = "A package containing scripts for demos";
  };
})
