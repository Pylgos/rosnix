{
  ament-flake8,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_mypy";
  version = "0.17.1-1";
  src = finalAttrs.passthru.sources."ament_mypy";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-mypy" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-mypy" ]; };
  checkInputs = [ ament-flake8 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-mock" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_mypy" = substituteSource {
      src = fetchgit {
        name = "ament_mypy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "ee3cc105753726632d19cc5772a9ad3ca859010b";
        hash = "sha256-hM3pes968NZW++cG6X/0jH3kUejkInacRxaXCI3p994=";
      };
    };
  });
  meta = {
    description = "Support for mypy static type checking in ament.";
  };
})
