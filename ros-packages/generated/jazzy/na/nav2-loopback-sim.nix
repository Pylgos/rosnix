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
  version = "1.3.12-1";
  src = finalAttrs.passthru.sources."nav2_loopback_sim";
  propagatedNativeBuildInputs = [ geometry-msgs nav2-simple-commander nav-msgs rclpy tf2-ros tf-transformations ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-transforms3d" ]; };
  propagatedBuildInputs = [ geometry-msgs nav2-simple-commander nav-msgs rclpy tf2-ros tf-transformations ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-transforms3d" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nav2_loopback_sim" = substituteSource {
      src = fetchgit {
        name = "nav2_loopback_sim-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "6d0711527d47e3ff0184dc7f41c2393882a5cd5c";
        hash = "sha256-6sUe7A9SxxbFq1WmxXRt0w6+yvR1ck0WgVUNp+4asNU=";
      };
    };
  });
  meta = {
    description = "A loopback simulator to replace physics simulation";
  };
})
