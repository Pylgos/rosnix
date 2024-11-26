{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-pycodestyle,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  uncrustify-vendor,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_uncrustify";
  version = "0.17.1-1";
  src = finalAttrs.passthru.sources."ament_uncrustify";
  propagatedNativeBuildInputs = [ uncrustify-vendor ];
  propagatedBuildInputs = [ uncrustify-vendor ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-pycodestyle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_uncrustify" = substituteSource {
      src = fetchgit {
        name = "ament_uncrustify-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "4b95da7542ecd4e0178956e8067b78be8c9588b8";
        hash = "sha256-zLma8lPxGUpuHaQSfwEtRY4npt/4bNCOHQbjmYWevgQ=";
      };
    };
  });
  meta = {
    description = "The ability to check code against style conventions using uncrustify and generate xUnit test result files.";
  };
})
