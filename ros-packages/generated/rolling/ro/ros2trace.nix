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
  version = "8.7.0-1";
  src = finalAttrs.passthru.sources."ros2trace";
  propagatedNativeBuildInputs = [ ros2cli tracetools-trace ];
  propagatedBuildInputs = [ ros2cli tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2trace" = substituteSource {
      src = fetchgit {
        name = "ros2trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "dbf4ef1ec7bb04d7d7b9919bfd338a41db205eb5";
        hash = "sha256-DW5RJUzTQVntwmqe30aL/9KA2Kw5BdT/n19s8xYBVU8=";
      };
    };
  });
  meta = {
    description = "The trace command for ROS 2 command line tools.";
  };
})
