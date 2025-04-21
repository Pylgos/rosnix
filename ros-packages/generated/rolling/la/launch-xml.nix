{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_xml";
  version = "3.8.1-1";
  src = finalAttrs.passthru.sources."launch_xml";
  propagatedBuildInputs = [ launch ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_xml" = substituteSource {
      src = fetchgit {
        name = "launch_xml-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "a946f41123094829cae225623abc424cac596e75";
        hash = "sha256-gH3R4+k5Rrv3l0/VzPlahhafd6VmhyZMFxKjndwsyTA=";
      };
    };
  });
  meta = {
    description = "XML frontend for the launch package.";
  };
})
