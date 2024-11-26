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
  launch,
  launch-ros,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tracetools-trace,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "tracetools_launch";
  version = "8.4.1-1";
  src = finalAttrs.passthru.sources."tracetools_launch";
  propagatedBuildInputs = [ launch launch-ros tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "tracetools_launch" = substituteSource {
        src = fetchgit {
          name = "tracetools_launch-source";
          url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
          rev = "829d95b0b8ac233c730df3f641304c013a4ce580";
          hash = "sha256-WB0G7aQBBSIiMd2j0bjAXKELBIV5smJLwaUupnr9088=";
        };
      };
    });
  };
  meta = {
    description = "Launch integration for tracing.";
  };
})
