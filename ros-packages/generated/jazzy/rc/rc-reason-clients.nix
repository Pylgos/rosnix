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
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."rc_reason_clients";
  propagatedNativeBuildInputs = [ geometry-msgs rc-reason-msgs rclpy ros2pkg tf2-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-requests" ]; };
  propagatedBuildInputs = [ geometry-msgs rc-reason-msgs rclpy ros2pkg tf2-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-requests" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rc_reason_clients" = substituteSource {
      src = fetchgit {
        name = "rc_reason_clients-source";
        url = "https://github.com/ros2-gbp/rc_reason_clients-release.git";
        rev = "c42f47862328da02354afdbf40f8d56c90765896";
        hash = "sha256-iGBpQF/HasB8G26gmzZJ3rjXC5Q4U/do0qWGIaEzDDA=";
      };
    };
  });
  meta = {
    description = "Clients for interfacing with Roboception reason modules on rc_visard and rc_cube.";
  };
})
