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
  pname = "ament_clang_format";
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."ament_clang_format";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang-format" "python3-yaml" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "clang-format" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_clang_format" = substituteSource {
      src = fetchgit {
        name = "ament_clang_format-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "d277f44c1a146208a59f65a19f9b8c6f890fa80a";
        hash = "sha256-tEcF42C45BFcCE6Lh0Tcz4tWrKOwZ6SEZaIPVP/pvTs=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code against style conventions using\n    clang-format and generate xUnit test result files.";
  };
})
