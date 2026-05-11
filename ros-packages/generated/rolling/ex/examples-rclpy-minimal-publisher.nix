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
  pname = "examples_rclpy_minimal_publisher";
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_publisher";
  propagatedNativeBuildInputs = [ rclpy std-msgs ];
  propagatedBuildInputs = [ rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_publisher" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_publisher-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "0ac10a953527d3597e6141a08ad192ca75d78a61";
        hash = "sha256-z/13LpNODA7XK64A1tm/z+p+U6pv2gIMEfMdT4VaY4E=";
      };
    };
  });
  meta = {
    description = "Examples of minimal publishers using rclpy.";
  };
})
