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
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "examples_rclpy_minimal_action_server";
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_action_server";
  propagatedBuildInputs = [ example-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_action_server" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_action_server-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "0bfaa358a63b8bc1f7ecfa7f1db366afe7eb7639";
        hash = "sha256-KYqLXOVHuLvkJFzeJoe7P3ZmBDjckZ6v5358ljw2bt4=";
      };
    };
  });
  meta = {
    description = "Examples of minimal action servers using rclpy.";
  };
})
