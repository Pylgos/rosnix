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
  version = "3.8.1-1";
  src = finalAttrs.passthru.sources."launch";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" "python3-lark-parser" "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python osrf-pycommon ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch" = substituteSource {
      src = fetchgit {
        name = "launch-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "286df38442bc226cdbfb1d85c39acdd59495bf80";
        hash = "sha256-7idESvzA6zxmqCuDBG1uzSnMiB7HrRBFunBep62siNo=";
      };
    };
  });
  meta = {
    description = "The ROS launch tool.";
  };
})
