{
  ament-flake8,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_mypy";
  version = "0.17.3-1";
  src = finalAttrs.passthru.sources."ament_mypy";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-mypy" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-mypy" ]; };
  checkInputs = [ ament-flake8 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-mock" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_mypy" = substituteSource {
      src = fetchgit {
        name = "ament_mypy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "85352e3e51cfcbdc45af8a3a3d973b041dd4fa2c";
        hash = "sha256-GSlgd9S9uYnIkkJUsT2d1e3LHp3T8qw2p5I5wgpu3kI=";
      };
    };
  });
  meta = {
    description = "Support for mypy static type checking in ament.";
  };
})
