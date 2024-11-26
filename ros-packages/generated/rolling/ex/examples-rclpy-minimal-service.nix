{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "examples_rclpy_minimal_service";
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_service";
  propagatedBuildInputs = [ example-interfaces rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "examples_rclpy_minimal_service" = substituteSource {
        src = fetchgit {
          name = "examples_rclpy_minimal_service-source";
          url = "https://github.com/ros2-gbp/examples-release.git";
          rev = "31d48265f253289f7c9ee2ba7f664fcb24037dd4";
          hash = "sha256-/D4IgfPIA5ImznS2d0EEbYEzSS1J8F2SMspqPaJYmN4=";
        };
      };
    });
  };
  meta = {
    description = "Examples of minimal service servers using rclpy.";
  };
})
