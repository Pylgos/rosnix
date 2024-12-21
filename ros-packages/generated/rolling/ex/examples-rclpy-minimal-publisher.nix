{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
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
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_publisher";
  propagatedBuildInputs = [ rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_publisher" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_publisher-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "20c5ec89c5071805ebc9af7f6ce850ceeb593b88";
        hash = "sha256-0NSptpZxrTEw9xhC52EZfGYliZX0iWgmr0zasRyqJw0=";
      };
    };
  });
  meta = {
    description = "Examples of minimal publishers using rclpy.";
  };
})
