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
  version = "0.17.5-1";
  src = finalAttrs.passthru.sources."ament_xmllint";
  propagatedNativeBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libxml2-utils" ]; };
  propagatedBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libxml2-utils" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_xmllint" = substituteSource {
      src = fetchgit {
        name = "ament_xmllint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "42458d32b6361b4f122cf24d0457ebb7156c5324";
        hash = "sha256-ZrWEQW7CNYc0nfcEOcf5RGoKtacpEZklKe5ru5NUT2M=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check XML files like the package manifest using xmllint\n    and generate xUnit test result files.\n  ";
  };
})
