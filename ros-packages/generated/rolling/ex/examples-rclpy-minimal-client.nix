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
  pname = "examples_rclpy_minimal_client";
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_client";
  propagatedBuildInputs = [ example-interfaces rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "2d45866682970c6e1e6412c6fdcf751f2d3fc852";
        hash = "sha256-lorY0Tpy1nSq+GeFZIbpCr+n65Ovhh+ee5QSWMsRSTI=";
      };
    };
  });
  meta = {
    description = "Examples of minimal service clients using rclpy.";
  };
})
