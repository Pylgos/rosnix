{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
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
  pname = "examples_rclpy_minimal_subscriber";
  version = "0.21.1-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_subscriber";
  propagatedNativeBuildInputs = [ rclpy std-msgs ];
  propagatedBuildInputs = [ rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_subscriber" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_subscriber-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "d484b9882dfca4db016c8a4f603380a29dddc9be";
        hash = "sha256-KTKEPEaSqCPbnqHlKwBPzXbZQs4CLDo9wMcFHFthfsQ=";
      };
    };
  });
  meta = {
    description = "Examples of minimal subscribers using rclpy.";
  };
})
