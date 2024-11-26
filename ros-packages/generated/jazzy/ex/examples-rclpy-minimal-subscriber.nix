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
  pname = "examples_rclpy_minimal_subscriber";
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_subscriber";
  propagatedBuildInputs = [ rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_subscriber" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_subscriber-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "7d29ff785559ea11d79ae4e58b24a0d995e96166";
        hash = "sha256-nuGs5Mzwj75ogKk/ZYVbwRHETmQJujeuUm+LaiLV/rc=";
      };
    };
  });
  meta = {
    description = "Examples of minimal subscribers using rclpy.";
  };
})
