{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-mypy,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  osrf-pycommon,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch";
  version = "3.9.3-1";
  src = finalAttrs.passthru.sources."launch";
  propagatedNativeBuildInputs = [ ament-index-python osrf-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" "python3-lark-parser" "python3-typing-extensions" "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python osrf-pycommon ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-importlib-metadata" "python3-lark-parser" "python3-typing-extensions" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch" = substituteSource {
      src = fetchgit {
        name = "launch-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "0d1273bdd0e9ad17b5ec735725bf8044d6de7a00";
        hash = "sha256-EoJm4FEaVppfulz8oc6i8LLpaHaPnqAwnAfYYVkMEKk=";
      };
    };
  });
  meta = {
    description = "The ROS launch tool.";
  };
})
