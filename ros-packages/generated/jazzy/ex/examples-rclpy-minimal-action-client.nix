{
  action-msgs,
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
  pname = "examples_rclpy_minimal_action_client";
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_action_client";
  propagatedBuildInputs = [ action-msgs example-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_action_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_action_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "3c333603cacbdde270f94bd36697211e18f9e635";
        hash = "sha256-vIQff2y6l1Jq5uMtp2HaEQut9x/n0LaWMp9RrMx5ACE=";
      };
    };
  });
  meta = {
    description = "Examples of minimal action clients using rclpy.";
  };
})
