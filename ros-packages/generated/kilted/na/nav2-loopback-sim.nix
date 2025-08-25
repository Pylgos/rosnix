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
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."nav2_loopback_sim";
  propagatedNativeBuildInputs = [ geometry-msgs nav2-simple-commander nav-msgs rclpy tf2-ros tf-transformations ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-transforms3d" ]; };
  propagatedBuildInputs = [ geometry-msgs nav2-simple-commander nav-msgs rclpy tf2-ros tf-transformations ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-transforms3d" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nav2_loopback_sim" = substituteSource {
      src = fetchgit {
        name = "nav2_loopback_sim-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "611db22b4e8a83430da58d4509a57f75afdad624";
        hash = "sha256-5JTiAzW1/tc1FF/Sf7cm1WM/9yhoYEfAPj5mv/ep7b8=";
      };
    };
  });
  meta = {
    description = "A loopback simulator to replace physics simulation";
  };
})
