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
  rc-reason-msgs,
  rclpy,
  ros2pkg,
  rosSystemPackages,
  substituteSource,
  tf2-msgs,
  visualization-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rc_reason_clients";
  version = "0.4.0-3";
  src = finalAttrs.passthru.sources."rc_reason_clients";
  propagatedNativeBuildInputs = [ geometry-msgs rc-reason-msgs rclpy ros2pkg tf2-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-requests" ]; };
  propagatedBuildInputs = [ geometry-msgs rc-reason-msgs rclpy ros2pkg tf2-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-requests" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rc_reason_clients" = substituteSource {
      src = fetchgit {
        name = "rc_reason_clients-source";
        url = "https://github.com/ros2-gbp/rc_reason_clients-release.git";
        rev = "a39365cb8f1edd5c5febd5206e6da5c9eff00e26";
        hash = "sha256-WI+zIg/6kZyvcTtK5zKnMl0PWGu5udO8YXCI3C1rY3E=";
      };
    };
  });
  meta = {
    description = "Clients for interfacing with Roboception reason modules on rc_visard and rc_cube.";
  };
})
