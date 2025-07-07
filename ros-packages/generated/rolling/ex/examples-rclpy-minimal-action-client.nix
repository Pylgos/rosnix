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
  version = "0.21.1-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_action_client";
  propagatedNativeBuildInputs = [ action-msgs example-interfaces rclpy ];
  propagatedBuildInputs = [ action-msgs example-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_action_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_action_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "c3e48b93452ce00693fdb167a9c9425b37bee8db";
        hash = "sha256-PlK2ToqT23Y0lbQV6OLOy67mAejBWNFANDGicz0Mj3c=";
      };
    };
  });
  meta = {
    description = "Examples of minimal action clients using rclpy.";
  };
})
