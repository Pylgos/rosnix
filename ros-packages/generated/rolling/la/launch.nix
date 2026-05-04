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
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch";
  version = "3.9.7-2";
  src = finalAttrs.passthru.sources."launch";
  propagatedNativeBuildInputs = [ ament-index-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-lark-parser" "python3-osrf-pycommon" "python3-typing-extensions" "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-lark-parser" "python3-osrf-pycommon" "python3-typing-extensions" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" "python3-types-pyyaml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch" = substituteSource {
      src = fetchgit {
        name = "launch-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "e16f9f0c45e7263bbf527dfb6dcec10c42d99fa7";
        hash = "sha256-PYzSwhinKn7QzsH+Pv1yoLq6b7aKwNkYYousMEuPpOg=";
      };
    };
  });
  meta = {
    description = "The ROS launch tool.";
  };
})
