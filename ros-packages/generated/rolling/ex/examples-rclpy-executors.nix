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
  pname = "examples_rclpy_executors";
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."examples_rclpy_executors";
  propagatedBuildInputs = [ rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_executors" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_executors-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "56f7e6870be80a874ac829366e79823a253613df";
        hash = "sha256-IYlG6xKnep/HobTEk+r+g5VNvZntu5wylILhyF+KkeI=";
      };
    };
  });
  meta = {
    description = "Examples of creating and using exectors to run multiple nodes in the same process";
  };
})
