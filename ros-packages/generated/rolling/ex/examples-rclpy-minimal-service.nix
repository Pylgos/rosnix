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
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_service";
  propagatedBuildInputs = [ example-interfaces rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_service" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_service-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "b695aafbf008b036233b150bb9b0a1dc358ce75a";
        hash = "sha256-0U4ju3T7oHjuRcfjcJfbwzpU/FWJsYPBiK2Jw++wxHE=";
      };
    };
  });
  meta = {
    description = "Examples of minimal service servers using rclpy.";
  };
})
