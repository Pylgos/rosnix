{
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
  pname = "ament_copyright";
  version = "0.19.2-1";
  src = finalAttrs.passthru.sources."ament_copyright";
  propagatedNativeBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" ]; };
  propagatedBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-importlib-metadata" ]; };
  checkInputs = [ ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_copyright" = substituteSource {
      src = fetchgit {
        name = "ament_copyright-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "68f5b172e5947872d8a31f2012e8ba0565fa813d";
        hash = "sha256-ph4GAOwQCii7rjfQS0s5Zj8LPJYnAkohF4z+wffDOu4=";
      };
    };
  });
  meta = {
    description = "The ability to check source files for copyright and license information.";
  };
})
