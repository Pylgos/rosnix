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
  version = "0.0.2-5";
  src = finalAttrs.passthru.sources."picknik_ament_copyright";
  propagatedNativeBuildInputs = [ ament-copyright ];
  checkInputs = [ ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "picknik_ament_copyright" = substituteSource {
      src = fetchgit {
        name = "picknik_ament_copyright-source";
        url = "https://github.com/ros2-gbp/picknik_ament_copyright-release.git";
        rev = "6cd350c41214ab5be92012ac5b0b8bdf2f35c3df";
        hash = "sha256-zw0URrOQbcL7fo+BgOUHgI0yqf0DDRVGnOOxbJmog48=";
      };
    };
  });
  meta = {
    description = "Check PickNik-specific copyright headers.";
  };
})
