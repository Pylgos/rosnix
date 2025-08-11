{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  axis-msgs,
  buildAmentPythonPackage,
  camera-info-manager-py,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ptz-action-server-msgs,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "axis_camera";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."axis_camera";
  propagatedNativeBuildInputs = [ axis-msgs camera-info-manager-py ptz-action-server-msgs sensor-msgs std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-requests" ]; };
  propagatedBuildInputs = [ axis-msgs camera-info-manager-py ptz-action-server-msgs sensor-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-requests" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "axis_camera" = substituteSource {
      src = fetchgit {
        name = "axis_camera-source";
        url = "https://github.com/clearpath-gbp/axis_camera-release.git";
        rev = "06bc30dd3665083d3ee3e83407a58b79cf188dae";
        hash = "sha256-+nYxR6OI/+pXUJ4t4jBmOQ9QOymGpa8HADip+ayI5ak=";
      };
    };
  });
  meta = {
    description = "ROS 2 driver for fixed and PTZ Axis cameras";
  };
})
