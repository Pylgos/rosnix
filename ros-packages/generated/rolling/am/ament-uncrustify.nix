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
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."ament_uncrustify";
  propagatedNativeBuildInputs = [ uncrustify-vendor ];
  propagatedBuildInputs = [ uncrustify-vendor ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-pycodestyle ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_uncrustify" = substituteSource {
      src = fetchgit {
        name = "ament_uncrustify-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "dfc47c33e833c2a1aeb5ebb83656a5cc127f66be";
        hash = "sha256-19KUbitAZ0sGhD1j/XrRiNYlbcZXVB/yOaWv45LcBJQ=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code against style conventions using uncrustify\n    and generate xUnit test result files.\n  ";
  };
})
