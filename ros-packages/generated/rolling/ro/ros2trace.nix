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
  version = "8.5.0-1";
  src = finalAttrs.passthru.sources."ros2trace";
  propagatedBuildInputs = [ ros2cli tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2trace" = substituteSource {
      src = fetchgit {
        name = "ros2trace-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "0b1445380c6757ac16fc8fbb91d35da0d669345a";
        hash = "sha256-aYWEPQlJ3IbXUE8GU9JicjSMANOwQp6Uni66RrGdHB4=";
      };
    };
  });
  meta = {
    description = "The trace command for ROS 2 command line tools.";
  };
})
