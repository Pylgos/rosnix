{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-pycodestyle,
  ament-xmllint,
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
  version = "0.20.1-1";
  src = finalAttrs.passthru.sources."ament_uncrustify";
  propagatedNativeBuildInputs = [ uncrustify-vendor ];
  propagatedBuildInputs = [ uncrustify-vendor ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-pycodestyle ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_uncrustify" = substituteSource {
      src = fetchgit {
        name = "ament_uncrustify-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "2acdcd726cb89fd50b1856d2fc081e7b20fa3018";
        hash = "sha256-arg3Z/CVxZKADlmqdQwijheKj/WBcXQZtiawPvg/4kE=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code against style conventions using uncrustify\n    and generate xUnit test result files.\n  ";
  };
})
