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
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."examples_rclpy_executors";
  propagatedBuildInputs = [ rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_executors" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_executors-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "56f31f768cde410db0820f4bd7f491cfa68cb9b4";
        hash = "sha256-my6ereGJc1avUzN3aOhoIL77r28XEeHKmwC+H/raxzU=";
      };
    };
  });
  meta = {
    description = "Examples of creating and using exectors to run multiple nodes in the same process";
  };
})
