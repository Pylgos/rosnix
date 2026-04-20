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
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."ament_clang_tidy";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang-tidy" "python3-yaml" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "clang-tidy" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_clang_tidy" = substituteSource {
      src = fetchgit {
        name = "ament_clang_tidy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "2d4f5a14ada49c751174d1624befb8ae9ccdc410";
        hash = "sha256-LzgFn8kPg2VtuOrscfOVapYY67/Ksc6eDH9FtMSEE24=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code against style conventions using\n    clang-tidy and generate xUnit test result files.";
  };
})
