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
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."rmf_demos_fleet_adapter";
  propagatedNativeBuildInputs = [ launch-xml rclpy rmf-fleet-adapter-python rmf-fleet-msgs rmf-task-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-fastapi" "python3-flask-socketio" "python3-numpy" "python3-pydantic" "python3-pyproj" "python3-requests" "python3-uvicorn" "python3-yaml" ]; };
  propagatedBuildInputs = [ launch-xml rclpy rmf-fleet-adapter-python rmf-fleet-msgs rmf-task-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-fastapi" "python3-flask-socketio" "python3-numpy" "python3-pydantic" "python3-pyproj" "python3-requests" "python3-uvicorn" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_fleet_adapter" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_fleet_adapter-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "4bcde5445c993e89367d983361ec51d31c7f384b";
        hash = "sha256-uTgEn7LJ0jqqe3OmusQJ7em1lzxUxYMUJHItvRHtS8I=";
      };
    };
  });
  meta = {
    description = "Fleet adapters for interfacing with RMF Demos robots with a fleet manager via REST API";
  };
})
