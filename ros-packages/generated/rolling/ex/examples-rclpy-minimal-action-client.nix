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
  version = "0.21.2-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_action_client";
  propagatedNativeBuildInputs = [ action-msgs example-interfaces rclpy ];
  propagatedBuildInputs = [ action-msgs example-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_action_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_action_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "c7ed74c88108ddb8a878b5842743f1e120d2179b";
        hash = "sha256-lvddQ3LQ7MjAJ5GvoO6Bz4CWF1Gqr9LiOLwWi5pctG8=";
      };
    };
  });
  meta = {
    description = "Examples of minimal action clients using rclpy.";
  };
})
