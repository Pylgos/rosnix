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
  version = "8.9.0-1";
  src = finalAttrs.passthru.sources."ros2trace";
  propagatedNativeBuildInputs = [ ros2cli tracetools-trace ];
  propagatedBuildInputs = [ ros2cli tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2trace" = substituteSource {
      src = fetchgit {
        name = "ros2trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "1aeb88c53a77d3a34176d8d2ed18d3a106b304d5";
        hash = "sha256-X4lSINr9DvVbRfLpMNNeOI+K8b8lVo+B9M/ZHKzC30g=";
      };
    };
  });
  meta = {
    description = "The trace command for ROS 2 command line tools.";
  };
})
