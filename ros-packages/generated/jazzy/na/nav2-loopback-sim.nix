{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclpy,
  rosSystemPackages,
  substituteSource,
  tf-transformations,
  tf2-ros,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "nav2_loopback_sim";
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."nav2_loopback_sim";
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclpy tf2-ros tf-transformations ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nav2_loopback_sim" = substituteSource {
      src = fetchgit {
        name = "nav2_loopback_sim-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "30a9225d5226973143272648768831a7f4552226";
        hash = "sha256-G56+UFs1c7RMbVcR1wHrMr9mtkHUwUy+voNb9nGX7x4=";
      };
    };
  });
  meta = {
    description = "A loopback simulator to replace physics simulation";
  };
})
