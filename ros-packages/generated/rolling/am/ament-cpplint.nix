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
  pname = "ament_cpplint";
  version = "0.19.1-1";
  src = finalAttrs.passthru.sources."ament_cpplint";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cpplint" = substituteSource {
      src = fetchgit {
        name = "ament_cpplint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "b8b4477c33c84e5efd9bf6e479c0790b80e45545";
        hash = "sha256-F1CpVy09Du/NYHc4ngJTIYEtetJ5881gXB7BAkc2wVk=";
      };
    };
  });
  meta = {
    description = "The ability to check code against the Google style conventions using cpplint and generate xUnit test result files.";
  };
})
