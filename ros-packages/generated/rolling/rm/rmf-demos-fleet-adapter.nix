{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-xml,
  mkSourceSet,
  rclpy,
  rmf-fleet-adapter-python,
  rmf-fleet-msgs,
  rmf-task-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rmf_demos_fleet_adapter";
  version = "2.8.1-2";
  src = finalAttrs.passthru.sources."rmf_demos_fleet_adapter";
  propagatedNativeBuildInputs = [ launch-xml rclpy rmf-fleet-adapter-python rmf-fleet-msgs rmf-task-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-fastapi" "python3-flask-socketio" "python3-numpy" "python3-pydantic" "python3-pyproj" "python3-requests" "python3-uvicorn" "python3-yaml" ]; };
  propagatedBuildInputs = [ launch-xml rclpy rmf-fleet-adapter-python rmf-fleet-msgs rmf-task-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-fastapi" "python3-flask-socketio" "python3-numpy" "python3-pydantic" "python3-pyproj" "python3-requests" "python3-uvicorn" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_fleet_adapter" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_fleet_adapter-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "3e2f3bf0e34bb0b7697c565fb1a02e66ead9f404";
        hash = "sha256-BkufNmiagJx6+BWiti1/jI1+DeI++sMHvzUAsVTdf40=";
      };
    };
  });
  meta = {
    description = "Fleet adapters for interfacing with RMF Demos robots with a fleet manager via REST API";
  };
})
