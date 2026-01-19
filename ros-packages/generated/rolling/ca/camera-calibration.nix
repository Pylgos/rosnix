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
  version = "7.1.3-1";
  src = finalAttrs.passthru.sources."camera_calibration";
  propagatedNativeBuildInputs = [ cv-bridge image-geometry message-filters rclpy sensor-msgs std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-opencv" "python3-semver" ]; };
  propagatedBuildInputs = [ cv-bridge image-geometry message-filters rclpy sensor-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-opencv" "python3-semver" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-requests" ]; };
  passthru.sources = mkSourceSet (sources: {
    "camera_calibration" = substituteSource {
      src = fetchgit {
        name = "camera_calibration-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "aece89444dd7035f6abfbf1c2bbc5d18f7ca7395";
        hash = "sha256-5QbQRO94qlHihhuPW2Ju17svto2MFfFO0u2YO/dXios=";
      };
    };
  });
  meta = {
    description = "\n     camera_calibration allows easy calibration of monocular or stereo\n     cameras using a checkerboard calibration target.\n  ";
  };
})
