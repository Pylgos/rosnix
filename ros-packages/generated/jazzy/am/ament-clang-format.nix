{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_clang_format";
  version = "0.17.1-1";
  src = finalAttrs.passthru.sources."ament_clang_format";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang-format" "python3-yaml" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "clang-format" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_clang_format" = substituteSource {
      src = fetchgit {
        name = "ament_clang_format-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "108127c8819c5e591ef89309ddea19d561a93915";
        hash = "sha256-5I1qvVL1RNpJvCZa9P5A6+XVad0TvhYEHISldjxpZ2I=";
      };
    };
  });
  meta = {
    description = "The ability to check code against style conventions using clang-format and generate xUnit test result files.";
  };
})
