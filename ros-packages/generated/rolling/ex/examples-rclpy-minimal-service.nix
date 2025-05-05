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
  version = "0.21.0-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_service";
  propagatedNativeBuildInputs = [ example-interfaces rclpy std-msgs ];
  propagatedBuildInputs = [ example-interfaces rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_service" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_service-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "3465ed99e2dffa383ac2664a665e57054eb259d8";
        hash = "sha256-LjWjpExqi2+IkCHVATrfxWB5OdSWTh6KZTejPaImmPI=";
      };
    };
  });
  meta = {
    description = "Examples of minimal service servers using rclpy.";
  };
})
