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
  version = "0.21.0-1";
  src = finalAttrs.passthru.sources."ament_lint";
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_lint" = substituteSource {
      src = fetchgit {
        name = "ament_lint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "53afb9f636d4ce9e734a3246aa33c7bbe29f6cd7";
        hash = "sha256-kcGwUjowmUhKWhELcZcrWTEIZZ0yOPImz5tkn1u3qNg=";
      };
    };
  });
  meta = {
    description = "\n    Providing common API for ament linter packages.\n  ";
  };
})
