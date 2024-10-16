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
let
  sources = mkSourceSet (sources: {
    "rc_reason_clients" = substituteSource {
      src = fetchgit {
        name = "rc_reason_clients-source";
        url = "https://github.com/ros2-gbp/rc_reason_clients-release.git";
        rev = "e8e4ce1459a8bae56c3865eaa512dbf4ee360532";
        hash = "sha256-nrDAYPBtkbSi1QAZJHR9jYhMnPLwemNMDxIzccehO1o=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentPythonPackage (finalAttrs: {
  pname = "rc_reason_clients";
  version = "0.3.1-3";
  src = finalAttrs.passthru.sources."rc_reason_clients";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs rc-reason-msgs rclpy ros2pkg tf2-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-requests" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Clients for interfacing with Roboception reason modules on rc_visard and rc_cube.";
  };
})
