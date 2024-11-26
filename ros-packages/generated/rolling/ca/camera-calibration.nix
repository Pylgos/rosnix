{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-geometry,
  message-filters,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "camera_calibration";
  version = "6.0.5-1";
  src = finalAttrs.passthru.sources."camera_calibration";
  propagatedBuildInputs = [ cv-bridge image-geometry message-filters rclpy sensor-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-opencv" "python3-semver" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-requests" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "camera_calibration" = substituteSource {
        src = fetchgit {
          name = "camera_calibration-source";
          url = "https://github.com/ros2-gbp/image_pipeline-release.git";
          rev = "d25cc11e195fefe30633762afdcb237f53f445f1";
          hash = "sha256-XUWvr4/CTlEDoUU7KbUDl1aTKeTzaWTrzAUOBtpc6gw=";
        };
      };
    });
  };
  meta = {
    description = "camera_calibration allows easy calibration of monocular or stereo cameras using a checkerboard calibration target.";
  };
})
