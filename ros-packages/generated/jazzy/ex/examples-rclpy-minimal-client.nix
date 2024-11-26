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
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "examples_rclpy_minimal_client";
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_client";
  propagatedBuildInputs = [ example-interfaces rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "d149821ca87d6608df40eb67fc9625e567a5d1a4";
        hash = "sha256-ArQUsjRTLQk95bcoXaFC1l3execpR74HzzFrOyYJpAk=";
      };
    };
  });
  meta = {
    description = "Examples of minimal service clients using rclpy.";
  };
})
