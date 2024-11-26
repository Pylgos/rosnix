{
  ament-copyright,
  ament-flake8,
  ament-mypy,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros2cli,
  rosSystemPackages,
  substituteSource,
  tracetools-trace,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2trace";
  version = "8.2.2-1";
  src = finalAttrs.passthru.sources."ros2trace";
  propagatedBuildInputs = [ ros2cli tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ros2trace" = substituteSource {
        src = fetchgit {
          name = "ros2trace-source";
          url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
          rev = "07fbf87983b1e02cc5f138768cd4a6d2456a6c5b";
          hash = "sha256-WhG58D33BNx94W7XCDeiImOsq/vkVF9rYMMjA+xTm1M=";
        };
      };
    });
  };
  meta = {
    description = "The trace command for ROS 2 command line tools.";
  };
})
