{
  ament-copyright,
  ament-flake8,
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
  pname = "picknik_ament_copyright";
  version = "0.0.2-4";
  src = finalAttrs.passthru.sources."picknik_ament_copyright";
  propagatedNativeBuildInputs = [ ament-copyright ];
  propagatedBuildInputs = [ ament-copyright ];
  checkInputs = [ ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "picknik_ament_copyright" = substituteSource {
      src = fetchgit {
        name = "picknik_ament_copyright-source";
        url = "https://github.com/ros2-gbp/picknik_ament_copyright-release.git";
        rev = "6b7823c44e2f1588d32fcaa65af0d53d9084efbb";
        hash = "sha256-zw0URrOQbcL7fo+BgOUHgI0yqf0DDRVGnOOxbJmog48=";
      };
    };
  });
  meta = {
    description = "\n    Check PickNik-specific copyright headers.\n  ";
  };
})
