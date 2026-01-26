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
  version = "0.17.4-1";
  src = finalAttrs.passthru.sources."ament_clang_format";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang-format" "python3-yaml" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "clang-format" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_clang_format" = substituteSource {
      src = fetchgit {
        name = "ament_clang_format-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "6d5a353747d1c08a82aee914faabbe6cc605caff";
        hash = "sha256-H5qbxC/roNz6LSnQHIiEjW+jWsZq3oZ5MWiG9SIgeGc=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code against style conventions using\n    clang-format and generate xUnit test result files.";
  };
})
