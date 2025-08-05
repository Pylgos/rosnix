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
  version = "0.20.2-1";
  src = finalAttrs.passthru.sources."ament_flake8";
  propagatedNativeBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-flake8" "python3-flake8-blind-except" "python3-flake8-builtins" "python3-flake8-class-newline" "python3-flake8-comprehensions" "python3-flake8-deprecated" "python3-flake8-docstrings" "python3-flake8-import-order" "python3-flake8-quotes" ]; };
  propagatedBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-flake8" "python3-flake8-blind-except" "python3-flake8-builtins" "python3-flake8-class-newline" "python3-flake8-comprehensions" "python3-flake8-deprecated" "python3-flake8-docstrings" "python3-flake8-import-order" "python3-flake8-quotes" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_flake8" = substituteSource {
      src = fetchgit {
        name = "ament_flake8-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "9a7b8afe7f187dc7eeac8724dea34368c80735cd";
        hash = "sha256-NdTsLxYG5AcyVXfr8WBQTPEyE7x4YBGL1Vwn13JSH/w=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code for style and syntax conventions with flake8.\n  ";
  };
})
