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
  version = "3.8.4-1";
  src = finalAttrs.passthru.sources."launch";
  propagatedNativeBuildInputs = [ ament-index-python osrf-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" "python3-lark-parser" "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python osrf-pycommon ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-importlib-metadata" "python3-lark-parser" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch" = substituteSource {
      src = fetchgit {
        name = "launch-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "dd9ac15e09b46b4fdba095f6c7c3ddf91d4c5ada";
        hash = "sha256-aGn6FyF7w72S9bv+XC1e7QdE7oLbl2oLOJ/nW8ArrA0=";
      };
    };
  });
  meta = {
    description = "The ROS launch tool.";
  };
})
