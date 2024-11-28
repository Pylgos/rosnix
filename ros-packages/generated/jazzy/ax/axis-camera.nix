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
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."axis_camera";
  propagatedBuildInputs = [ axis-msgs camera-info-manager-py ptz-action-server-msgs sensor-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-requests" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "axis_camera" = substituteSource {
      src = fetchgit {
        name = "axis_camera-source";
        url = "https://github.com/clearpath-gbp/axis_camera-release.git";
        rev = "b81e47f4640cf2e82b35df68874503725922bc71";
        hash = "sha256-17QrfCkOCwcgjRWN8DgeMdrTC54OK1stZ4FA99C4+s0=";
      };
    };
  });
  meta = {
    description = "ROS 2 driver for fixed and PTZ Axis cameras";
  };
})
