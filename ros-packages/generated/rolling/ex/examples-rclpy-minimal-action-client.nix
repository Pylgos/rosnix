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
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_action_client";
  propagatedBuildInputs = [ action-msgs example-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_action_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_action_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "1d30e84fceac07df3eb5b6c9b4039d62aae324f0";
        hash = "sha256-A74S7JuXrwJcOEGTJEYcyDzaeiJRVePnTFq/UTQtRQY=";
      };
    };
  });
  meta = {
    description = "Examples of minimal action clients using rclpy.";
  };
})
