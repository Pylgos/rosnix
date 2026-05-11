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
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_subscriber";
  propagatedNativeBuildInputs = [ rclpy std-msgs ];
  propagatedBuildInputs = [ rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_subscriber" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_subscriber-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "49e0610e1a2b7c2c247c1923dcf47ac3caad0d35";
        hash = "sha256-z7E/3ql8XS9XRbssLL7sTzgQkM/FaYtjt1ORQjZZ6rM=";
      };
    };
  });
  meta = {
    description = "Examples of minimal subscribers using rclpy.";
  };
})
