{
  ament-lint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_flake8";
  version = "0.17.1-1";
  src = finalAttrs.passthru.sources."ament_flake8";
  propagatedNativeBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-flake8" "python3-flake8-builtins" "python3-flake8-comprehensions" "python3-flake8-docstrings" "python3-flake8-import-order" "python3-flake8-quotes" ]; };
  propagatedBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-flake8" "python3-flake8-builtins" "python3-flake8-comprehensions" "python3-flake8-docstrings" "python3-flake8-import-order" "python3-flake8-quotes" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_flake8" = substituteSource {
      src = fetchgit {
        name = "ament_flake8-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "14de142529f6aec081b365637f2683109321440d";
        hash = "sha256-0sUE60ee36OXnMpBjLcxwpNlozQqWJUTo5BI9/c2Wfo=";
      };
    };
  });
  meta = {
    description = "The ability to check code for style and syntax conventions with flake8.";
  };
})
