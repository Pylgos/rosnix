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
  pname = "examples_rclpy_executors";
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."examples_rclpy_executors";
  propagatedBuildInputs = [ rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_executors" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_executors-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "3cd171437d698a92f9e5a2dae9b1ea9514e156f0";
        hash = "sha256-D2/VFcVtE/o7xbLmqJSRM8BZhaHWvJWpYRoUTnimDR4=";
      };
    };
  });
  meta = {
    description = "Examples of creating and using exectors to run multiple nodes in the same process";
  };
})
