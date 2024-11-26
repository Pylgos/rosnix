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
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "tracetools_read";
  version = "8.2.2-1";
  src = finalAttrs.passthru.sources."tracetools_read";
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-babeltrace" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_read" = substituteSource {
      src = fetchgit {
        name = "tracetools_read-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "48cb7678e728dc7598fb59557128ca80d06753c3";
        hash = "sha256-ukhc281p7QYYiNjLhf5alREqxspi0wu04fc92FLwz1A=";
      };
    };
  });
  meta = {
    description = "Tools for reading traces.";
  };
})
