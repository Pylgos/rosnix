{
  action-msgs,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lifecycle-msgs,
  mkSourceSet,
  nav2-msgs,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "nav2_simple_commander";
  version = "1.3.4-1";
  src = finalAttrs.passthru.sources."nav2_simple_commander";
  propagatedBuildInputs = [ action-msgs geometry-msgs lifecycle-msgs nav2-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nav2_simple_commander" = substituteSource {
      src = fetchgit {
        name = "nav2_simple_commander-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "e47c1dd0d08ce5b2af671624988417d17c1d6c20";
        hash = "sha256-miEz/HyTEwL+729SeAxmmKX/8J5n+2HkK1hUptCPl6Q=";
      };
    };
  });
  meta = {
    description = "An importable library for writing mobile robot applications in python3";
  };
})
