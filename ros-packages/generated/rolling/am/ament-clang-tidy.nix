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
  version = "0.20.2-1";
  src = finalAttrs.passthru.sources."ament_clang_tidy";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang-tidy" "python3-yaml" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "clang-tidy" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_clang_tidy" = substituteSource {
      src = fetchgit {
        name = "ament_clang_tidy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "5e9987bcb7ab3f73d3e1ce5e89c6c41916c6d492";
        hash = "sha256-+ltbx3PXxeO5gn/qX6myO45xPgGLOkJd7UOgnjPISco=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code against style conventions using\n    clang-tidy and generate xUnit test result files.";
  };
})
