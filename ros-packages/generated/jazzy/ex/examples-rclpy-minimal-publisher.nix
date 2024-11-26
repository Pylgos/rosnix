{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
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
  pname = "examples_rclpy_minimal_publisher";
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_publisher";
  propagatedBuildInputs = [ rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "examples_rclpy_minimal_publisher" = substituteSource {
        src = fetchgit {
          name = "examples_rclpy_minimal_publisher-source";
          url = "https://github.com/ros2-gbp/examples-release.git";
          rev = "46e87448dadb5671d4688a05ecf121c0c03abab9";
          hash = "sha256-VysiiWLtXoquWvhGtov2Uj90jvJ+GFRDkAGu9KUIMjg=";
        };
      };
    });
  };
  meta = {
    description = "Examples of minimal publishers using rclpy.";
  };
})
