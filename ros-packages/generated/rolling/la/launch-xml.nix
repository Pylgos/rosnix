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
  version = "3.7.0-1";
  src = finalAttrs.passthru.sources."launch_xml";
  propagatedBuildInputs = [ launch ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "launch_xml" = substituteSource {
        src = fetchgit {
          name = "launch_xml-source";
          url = "https://github.com/ros2-gbp/launch-release.git";
          rev = "55bf484036026575fc8444660d226257f90e649a";
          hash = "sha256-Z7x74iH6ca8Osdv3A5ho52OPRuTq6u9UA281rN/CIeY=";
        };
      };
    });
  };
  meta = {
    description = "XML frontend for the launch package.";
  };
})
