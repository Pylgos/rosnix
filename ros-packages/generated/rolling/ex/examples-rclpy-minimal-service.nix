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
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "examples_rclpy_minimal_service";
  version = "0.21.1-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_service";
  propagatedNativeBuildInputs = [ example-interfaces rclpy std-msgs ];
  propagatedBuildInputs = [ example-interfaces rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_service" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_service-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "d131cb6785ec669cf9997710bec3a2e5d4754216";
        hash = "sha256-XXka2W4oguWZufbiZXz0K3JIPG98Sim4/+foO7SZKpc=";
      };
    };
  });
  meta = {
    description = "Examples of minimal service servers using rclpy.";
  };
})
