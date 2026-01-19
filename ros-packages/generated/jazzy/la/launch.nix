{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-mypy,
  ament-pep257,
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
  version = "3.4.10-1";
  src = finalAttrs.passthru.sources."launch";
  propagatedNativeBuildInputs = [ ament-index-python osrf-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" "python3-lark-parser" "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python osrf-pycommon ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-importlib-metadata" "python3-lark-parser" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch" = substituteSource {
      src = fetchgit {
        name = "launch-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "971d9a225177b08a643972a1ec1d2b3ae3de05ea";
        hash = "sha256-AAYPFAHCI4QiwerCbASFPoZQlxHya0aalPjzauP7urk=";
      };
    };
  });
  meta = {
    description = "The ROS launch tool.";
  };
})
