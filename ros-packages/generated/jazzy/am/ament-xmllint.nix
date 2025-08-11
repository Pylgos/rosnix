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
  version = "0.17.3-1";
  src = finalAttrs.passthru.sources."ament_xmllint";
  propagatedNativeBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libxml2-utils" ]; };
  propagatedBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libxml2-utils" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_xmllint" = substituteSource {
      src = fetchgit {
        name = "ament_xmllint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "433edb7b63fa9c7f6e5b2e3566389b126adf9c0a";
        hash = "sha256-QneiSBec9Q0fHrcoC3Xaih34ue/UHZR6yuGZh+kPkzw=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check XML files like the package manifest using xmllint\n    and generate xUnit test result files.\n  ";
  };
})
