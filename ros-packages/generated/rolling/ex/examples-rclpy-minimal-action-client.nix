{
  action-msgs,
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
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "examples_rclpy_minimal_action_client";
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_action_client";
  propagatedBuildInputs = [ action-msgs example-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_action_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_action_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "a22628f6d859fbac3883b79cb76e0a60625cde35";
        hash = "sha256-YNCMiwkTrbfZeA+OPl3nTVolBk0vDG31EbnXX+bU5w0=";
      };
    };
  });
  meta = {
    description = "Examples of minimal action clients using rclpy.";
  };
})
