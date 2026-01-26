{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_lint";
  version = "0.17.4-1";
  src = finalAttrs.passthru.sources."ament_lint";
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_lint" = substituteSource {
      src = fetchgit {
        name = "ament_lint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "9e80d6294f1ddb6f78d28c7a68f7aba57b24cbc5";
        hash = "sha256-5BG8/xjvYjRUk14FKHU91odc5EBhke7JwP/lu6lTrDg=";
      };
    };
  });
  meta = {
    description = "\n    Providing common API for ament linter packages.\n  ";
  };
})
