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
  tracetools-launch,
  tracetools-read,
  tracetools-trace,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "tracetools_test";
  version = "8.2.4-1";
  src = finalAttrs.passthru.sources."tracetools_test";
  propagatedNativeBuildInputs = [ launch launch-ros tracetools-launch tracetools-read tracetools-trace ];
  propagatedBuildInputs = [ launch launch-ros tracetools-launch tracetools-read tracetools-trace ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tracetools_test" = substituteSource {
      src = fetchgit {
        name = "tracetools_test-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "ad169f40b905567b345b96feda93af921f1bc775";
        hash = "sha256-e9Lr8zFhd2DrJmM/mnWN2v3Z8gGKL7mxw5DPF6+8iWI=";
      };
    };
  });
  meta = {
    description = "Utilities for tracing-related tests.";
  };
})
