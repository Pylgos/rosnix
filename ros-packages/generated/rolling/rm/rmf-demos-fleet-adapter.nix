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
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."rmf_demos_fleet_adapter";
  propagatedNativeBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ launch-xml rmf-fleet-adapter-python rmf-fleet-msgs rmf-task-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-fastapi" "python3-flask-socketio" "python3-numpy" "python3-pydantic" "python3-pyproj" "python3-requests" "python3-uvicorn" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_fleet_adapter" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_fleet_adapter-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "2f93d6e7610268eb976741bb4a4fb4c4088fb55e";
        hash = "sha256-u7THnIhqELKHjkw9mUu0OHneou1RLbPYAviZsBymj2s=";
      };
    };
  });
  meta = {
    description = "Fleet adapters for interfacing with RMF Demos robots with a fleet manager via REST API";
  };
})
