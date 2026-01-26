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
  version = "0.21.4-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_subscriber";
  propagatedNativeBuildInputs = [ rclpy std-msgs ];
  propagatedBuildInputs = [ rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_subscriber" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_subscriber-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "fdea5fa9ac324ed0dc99c2d6a64172d8a5d2a593";
        hash = "sha256-4GPC2Sgd7unkq4rASpUoDnp4qx6HHaDyomJ2cB0DLzg=";
      };
    };
  });
  meta = {
    description = "Examples of minimal subscribers using rclpy.";
  };
})
