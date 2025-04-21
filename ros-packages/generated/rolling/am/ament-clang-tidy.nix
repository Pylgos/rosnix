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
  pname = "ament_clang_tidy";
  version = "0.19.2-1";
  src = finalAttrs.passthru.sources."ament_clang_tidy";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang-tidy" "python3-yaml" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "clang-tidy" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_clang_tidy" = substituteSource {
      src = fetchgit {
        name = "ament_clang_tidy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "3102bf7817ce5a304192a5728d3318e4fe0f2ab0";
        hash = "sha256-y8veskF9KpL9ViKRVIE7jKvoG3qsLg9+C7w2QqRuzxU=";
      };
    };
  });
  meta = {
    description = "The ability to check code against style conventions using clang-tidy and generate xUnit test result files.";
  };
})
