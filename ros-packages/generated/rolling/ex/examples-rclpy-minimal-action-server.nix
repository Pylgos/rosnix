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
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_action_server";
  propagatedBuildInputs = [ example-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_action_server" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_action_server-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "b317243c1b0735d4207250ecdce430ccc4be9dae";
        hash = "sha256-SCUgpsXiLK21cRVNwJ2WgszyiTZSJYbuf1n6KK06+7M=";
      };
    };
  });
  meta = {
    description = "Examples of minimal action servers using rclpy.";
  };
})
