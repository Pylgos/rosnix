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
  pname = "examples_rclpy_minimal_service";
  version = "0.19.5-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_service";
  propagatedNativeBuildInputs = [ example-interfaces rclpy std-msgs ];
  propagatedBuildInputs = [ example-interfaces rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_service" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_service-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "3c414081588e5afd39727bf7721f77757d9520cd";
        hash = "sha256-Kjv6xbVGjYya4NsGL9+q3rtO2ZUHhpy1OHqlscYS8NM=";
      };
    };
  });
  meta = {
    description = "Examples of minimal service servers using rclpy.";
  };
})
