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
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_action_server";
  propagatedNativeBuildInputs = [ example-interfaces rclpy ];
  propagatedBuildInputs = [ example-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_action_server" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_action_server-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "773116414b69f55e5e8e2a72050005cee5fe9194";
        hash = "sha256-/rxmOVmN0bDYmTiDYxd9saZ2KJNXSAzxatG2oUyblj4=";
      };
    };
  });
  meta = {
    description = "Examples of minimal action servers using rclpy.";
  };
})
