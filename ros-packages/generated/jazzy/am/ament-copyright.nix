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
  version = "0.17.1-1";
  src = finalAttrs.passthru.sources."ament_copyright";
  propagatedNativeBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" ]; };
  propagatedBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-importlib-metadata" ]; };
  checkInputs = [ ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_copyright" = substituteSource {
        src = fetchgit {
          name = "ament_copyright-source";
          url = "https://github.com/ros2-gbp/ament_lint-release.git";
          rev = "f654101da3cf1def189f0c17a520ae92f28798bd";
          hash = "sha256-LVeMfca8EQ5mvYuUo13PqnkllrAvlbUo0VOev/twp4k=";
        };
      };
    });
  };
  meta = {
    description = "The ability to check source files for copyright and license information.";
  };
})
