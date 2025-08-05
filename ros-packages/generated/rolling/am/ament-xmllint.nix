{
  ament-copyright,
  ament-flake8,
  ament-lint,
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
  pname = "ament_xmllint";
  version = "0.20.2-1";
  src = finalAttrs.passthru.sources."ament_xmllint";
  propagatedNativeBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libxml2-utils" ]; };
  propagatedBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libxml2-utils" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_xmllint" = substituteSource {
      src = fetchgit {
        name = "ament_xmllint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "fa41815a9caac5451185bc8fd2d32fb7047b57c5";
        hash = "sha256-Bois9cdC8eHHmw7rHGk1q/q0yKwS14MiErAz2JnlACg=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check XML files like the package manifest using xmllint\n    and generate xUnit test result files.\n  ";
  };
})
