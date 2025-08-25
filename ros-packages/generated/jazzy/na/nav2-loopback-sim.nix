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
  nav2-simple-commander,
  rclpy,
  rosSystemPackages,
  substituteSource,
  tf-transformations,
  tf2-ros,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "nav2_loopback_sim";
  version = "1.3.8-1";
  src = finalAttrs.passthru.sources."nav2_loopback_sim";
  propagatedNativeBuildInputs = [ geometry-msgs nav2-simple-commander nav-msgs rclpy tf2-ros tf-transformations ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-transforms3d" ]; };
  propagatedBuildInputs = [ geometry-msgs nav2-simple-commander nav-msgs rclpy tf2-ros tf-transformations ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-transforms3d" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nav2_loopback_sim" = substituteSource {
      src = fetchgit {
        name = "nav2_loopback_sim-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "cba281c6f6923bce993efa38d3277712867c5dd3";
        hash = "sha256-LDgRIoQZ8ELKa/95+sVs6SrsB8VvbD/34ofyOA5Xrfw=";
      };
    };
  });
  meta = {
    description = "A loopback simulator to replace physics simulation";
  };
})
