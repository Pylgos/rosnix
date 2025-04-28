{
  ament-copyright,
  ament-flake8,
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
  pname = "ament_pclint";
  version = "0.20.0-1";
  src = finalAttrs.passthru.sources."ament_pclint";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pclint" = substituteSource {
      src = fetchgit {
        name = "ament_pclint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "60bbc989cc3c0581d9100b855dfd1f3d7f8df809";
        hash = "sha256-eiBVFuPEsbpenbfDAGDG02kbJvVuNZTZheA74813Jn8=";
      };
    };
  });
  meta = {
    description = "The ability to perform static code analysis on C/C++ code using PC-lint and generate xUnit test result files.";
  };
})
