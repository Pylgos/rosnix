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
  version = "0.17.3-1";
  src = finalAttrs.passthru.sources."ament_clang_format";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang-format" "python3-yaml" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "clang-format" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_clang_format" = substituteSource {
      src = fetchgit {
        name = "ament_clang_format-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "d8df1bf93f730d9d221853c3a9724945d92f17dd";
        hash = "sha256-q5rPPsmNfuuY1Dy32rzNMtIrw2b25Nqfr0ULcQvOTnY=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code against style conventions using\n    clang-format and generate xUnit test result files.";
  };
})
