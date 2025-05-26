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
  version = "5.0.11-1";
  src = finalAttrs.passthru.sources."camera_calibration";
  propagatedNativeBuildInputs = [ cv-bridge image-geometry message-filters rclpy sensor-msgs std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-opencv" "python3-semver" ]; };
  propagatedBuildInputs = [ cv-bridge image-geometry message-filters rclpy sensor-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-opencv" "python3-semver" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-requests" ]; };
  passthru.sources = mkSourceSet (sources: {
    "camera_calibration" = substituteSource {
      src = fetchgit {
        name = "camera_calibration-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "e6b01d885ca3d482e9f4e490b075806954e274d5";
        hash = "sha256-zSs/F29LzlHYjqFRISr2oiOKtVG6RnH668QsyPZSYvs=";
      };
    };
  });
  meta = {
    description = "\n     camera_calibration allows easy calibration of monocular or stereo\n     cameras using a checkerboard calibration target.\n  ";
  };
})
