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
  version = "0.19.3-2";
  src = finalAttrs.passthru.sources."ament_uncrustify";
  propagatedNativeBuildInputs = [ uncrustify-vendor ];
  propagatedBuildInputs = [ uncrustify-vendor ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-pycodestyle ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_uncrustify" = substituteSource {
      src = fetchgit {
        name = "ament_uncrustify-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "b6349de7fedb9a59d4880b0197fff6a03c90c2e9";
        hash = "sha256-Nx40YaOl4loN8NHh02eE8ttv/K0iBdKb7TthMcNkaYI=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code against style conventions using uncrustify\n    and generate xUnit test result files.\n  ";
  };
})
