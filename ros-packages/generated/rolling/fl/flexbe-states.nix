{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe-core,
  flexbe-msgs,
  flexbe-testing,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "flexbe_states";
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."flexbe_states";
  propagatedNativeBuildInputs = [ flexbe-core flexbe-msgs flexbe-testing rclpy ];
  propagatedBuildInputs = [ flexbe-core flexbe-msgs flexbe-testing rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "flexbe_states" = substituteSource {
      src = fetchgit {
        name = "flexbe_states-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "4c86a317b76c58c3b06c4e002dafd18129c20e19";
        hash = "sha256-9nCf5YRLrdFBBRGVTkMGtiBfcHoiWNVdCLwqKnaSv3k=";
      };
    };
  });
  meta = {
    description = "\n      flexbe_states provides a collection of common generic predefined states.\n    ";
  };
})
