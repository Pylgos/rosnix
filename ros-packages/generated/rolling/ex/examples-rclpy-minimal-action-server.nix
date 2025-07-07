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
  version = "0.21.1-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_action_server";
  propagatedNativeBuildInputs = [ example-interfaces rclpy ];
  propagatedBuildInputs = [ example-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_action_server" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_action_server-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "7219361d905f08bb852b2ca0f20a8ff83b80af97";
        hash = "sha256-APgU32Nqz5MIQFx1cx3+u9Yn1if0eSrPEb543WJSxJk=";
      };
    };
  });
  meta = {
    description = "Examples of minimal action servers using rclpy.";
  };
})
