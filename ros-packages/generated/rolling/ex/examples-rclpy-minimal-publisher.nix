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
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_publisher";
  propagatedBuildInputs = [ rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_publisher" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_publisher-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "a046af889791bff183f1882d49f078b19cbea9b0";
        hash = "sha256-+LHbIEkM/LVm17DECh5mLAsTFI8wn6vke5WktGUBpG4=";
      };
    };
  });
  meta = {
    description = "Examples of minimal publishers using rclpy.";
  };
})
