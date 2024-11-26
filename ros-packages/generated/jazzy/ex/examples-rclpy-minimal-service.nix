{
  ament-copyright,
  ament-flake8,
  ament-pep257,
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
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_service";
  propagatedBuildInputs = [ example-interfaces rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_service" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_service-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "974f22c135ba13dab49c95d5268e06ecd6d46805";
        hash = "sha256-jrpXqNzN9kxaRAjcxrJQvNyjOtifMEcr+3dqMovB9zY=";
      };
    };
  });
  meta = {
    description = "Examples of minimal service servers using rclpy.";
  };
})
