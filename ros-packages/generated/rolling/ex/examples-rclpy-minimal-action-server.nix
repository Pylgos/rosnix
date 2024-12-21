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
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "examples_rclpy_minimal_action_server";
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_action_server";
  propagatedBuildInputs = [ example-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_action_server" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_action_server-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "4d8c9d4f8c60b1fe13525c70a66a8ae49a98145d";
        hash = "sha256-EUhZHFvOYmFV3Dwjev44AgOUY6YuNVXrRPGirSZcJ6Y=";
      };
    };
  });
  meta = {
    description = "Examples of minimal action servers using rclpy.";
  };
})
