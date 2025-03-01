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
  version = "3.8.0-1";
  src = finalAttrs.passthru.sources."launch_xml";
  propagatedBuildInputs = [ launch ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_xml" = substituteSource {
      src = fetchgit {
        name = "launch_xml-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "04713a947fa3eee87bc8ee78572238ee39497bc5";
        hash = "sha256-UMfLIXPdn4rtcTrIjVZTYJkW3rdZO9AQPwj4+1C4oxM=";
      };
    };
  });
  meta = {
    description = "XML frontend for the launch package.";
  };
})
