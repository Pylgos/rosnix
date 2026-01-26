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
  version = "0.21.4-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_publisher";
  propagatedNativeBuildInputs = [ rclpy std-msgs ];
  propagatedBuildInputs = [ rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_publisher" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_publisher-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "e34f0e2fce453b400b0a2535e4e4254a671d0343";
        hash = "sha256-cSvroVxuHDtV6ab4lleZDrYovRnuhiuhhm7WfAPcauA=";
      };
    };
  });
  meta = {
    description = "Examples of minimal publishers using rclpy.";
  };
})
